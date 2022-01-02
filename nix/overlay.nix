pkgs: prevPkgs:
{
  retro68 = pkgs.lib.makeScope pkgs.newScope (self:
    {
      platforms = import ./platforms.nix;

      monolithic = with pkgs;
        stdenv.mkDerivation {
          name = "retro68.monolithic";
          src = ../.;
          nativeBuildInputs = [ cmake bison flex ruby ninja bash ];
          buildInputs = [ boost gmp mpfr libmpc zlib ]
            ++ lib.optional hostPlatform.isDarwin
            darwin.apple_sdk.frameworks.ApplicationServices;
          buildCommand = ''
            bash $src/build-toolchain.bash --ninja --prefix=$out --no-carbon
          '';
          hardeningDisable = [ "format" ];
        };

      # ----------- Native Tools -------------
      # hfsutils -- Utilities for manipulating HFS volumes & disk images.
      hfsutils = with pkgs;
        stdenv.mkDerivation {
          name = "retro68.hfsutils";
          srcs = ../hfsutils;

          preConfigure = ''
            mkdir -p $out/bin
            mkdir -p $out/lib
            mkdir -p $out/include
            mkdir -p $out/share/man/man1
          '';
          configureFlags = [ "--mandir=$(out)/share/man" "--enable-devlibs" ];
        };

      # tools -- native tools that are part of Retro68
      tools = with pkgs;
        stdenv.mkDerivation {
          name = "retro68.tools";
          src = nix-gitignore.gitignoreSource [
            "/*"
            "!/CMakeLists.txt"
            "!/libelf" # should perhaps use nixpkg's libelf instead?
            "!/cmake"
            "!/LaunchAPPL"
            "!/libretro"
            "!/PEFTools"
            "!/ResourceFiles"
            "!/Rez"
            "!/Elf2Mac"
            "!/ConvertObj"
            "!/ConvertDiskImage"
          ] ./..;

          nativeBuildInputs = [ cmake bison flex ];
          buildInputs = [ boost zlib retro68.hfsutils ]
            ++ lib.optional hostPlatform.isDarwin
            darwin.apple_sdk.frameworks.ApplicationServices;
        };

    } // prevPkgs.lib.optionalAttrs (prevPkgs.targetPlatform ? retro68) {

      # ----------- Binutils & GCC -------------

      # binutils_unwrapped -- binutils, without any wrappers
      binutils_unwrapped = with pkgs;
        stdenv.mkDerivation rec {
          name = "retro68.binutils_unwrapped";
          src = ../binutils;

          configureFlags =
            [ "--target=${stdenv.targetPlatform.config}" "--disable-doc" ]
            ++ stdenv.targetPlatform.retro68BinutilsConfig or [ ];
          enableParallelBuilding = true;

          postInstall = let
            ld = "$out/bin/${stdenv.targetPlatform.config}-ld";
            ld_real = "$out/bin/${stdenv.targetPlatform.config}-ld.real";

          in ''
            mv ${ld} ${ld_real}

            echo "#!${stdenv.shell}" > ${ld}
            echo "exec \$'' + ''
              {RETRO68_LD_WRAPPER_${stdenv.targetPlatform.cmakeSystemName}-${ld_real}} \"\$@\"" >> ${ld}
                              chmod +x ${ld}

                              rm $out/${stdenv.targetPlatform.config}/bin/ld
                              ln -s ${ld} $out/${stdenv.targetPlatform.config}/bin/ld
                            '';
        };

      # gcc -- gcc, without any wrappers
      gcc_unwrapped = with pkgs;
        stdenv.mkDerivation rec {
          name = "retro68.gcc_unwrapped";
          src = ../gcc;
          buildInputs = [ retro68.binutils_unwrapped gmp mpfr libmpc ];
          configureFlags = [
            "--target=${stdenv.targetPlatform.config}"
            "--enable-languages=c,c++"
            "--disable-libssp"
            "MAKEINFO=missing"
          ] ++ stdenv.targetPlatform.retro68GccConfig or [ ];
          hardeningDisable = [ "format" ];
          enableParallelBuilding = true;

          # nix does in-source builds by default, and something breaks
          buildCommand = ''
            mkdir -p $out/${stdenv.targetPlatform.config}/bin
            ln -s ${retro68.binutils_unwrapped}/${stdenv.targetPlatform.config}/bin/* $out/${stdenv.targetPlatform.config}/bin/

            export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
            $src/configure ${builtins.toString configureFlags} --prefix=$out
            make -j$NIX_BUILD_CORES
            make install
          '';
        };

    } // prevPkgs.lib.optionalAttrs (prevPkgs.hostPlatform ? retro68) {

      setup_hook = let
        systemName = pkgs.targetPlatform.cmakeSystemName;
        toolchain = pkgs.writeTextFile {
          name = "retro68.cmake-toolchain";
          text = ''
            set(CMAKE_SYSTEM_NAME ${systemName})
            set(CMAKE_SYSTEM_VERSION 1)
            set(CMAKE_CROSSCOMPILING TRUE)

            set(REZ "${pkgs.buildPackages.retro68.tools}/bin/Rez" )
            set(REZ_TEMPLATES_PATH ${pkgs.retro68.libretro}/RIncludes)

            set(MAKE_PEF "${pkgs.buildPackages.retro68.tools}/bin/MakePEF" )

            include(${../cmake/add_application.cmake})
          '';
        };
        hook = pkgs.writeTextFile {
          name = "retro68.setup_hook";
          text = ''
            export CMAKE_TOOLCHAIN_FILE=${toolchain}

            retro68_addRIncludes() {
              case $depHostOffset in
                  -1) local role='BUILD_' ;;
                  0)  local role="" ;;
                  1)  local role='TARGET_' ;;
                  *)  echo "retro68_addRIncludes: Error: Cannot be used with $depHostOffset-offset deps" >2;
                      return 1 ;;
              esac

              if [[ -d "$1/RIncludes" ]]; then
                  export REZ_INCLUDE_PATH+=":$1/RIncludes"
              fi
            }

            addEnvHooks "$targetOffset" retro68_addRIncludes

          '' + (pkgs.lib.optionalString (systemName == "Retro68") ''
            export RETRO68_LD_WRAPPER_Retro68="${pkgs.buildPackages.retro68.tools}/bin/Elf2Mac"
            export RETRO68_REAL_LD="${pkgs.buildPackages.retro68.binutils_unwrapped}/bin/m68k-apple-macos-ld.real"
          '');
        };
      in pkgs.makeSetupHook { } hook;

      # ----------- Retro68 core libraries -------------

      # multiversal -- multiversal interfaces
      multiversal = with pkgs;
        (stdenv.override {
          cc = stdenv.cc.override { extraPackages = [ ]; };
        }).mkDerivation {
          name = "retro68.multiversal";
          src = ../multiversal;
          nativeBuildInputs = [ buildPackages.ruby ];
          buildCommand = ''
            echo $src
            build=`pwd`
            (cd $src && ruby make-multiverse.rb -G CIncludes -o "$build")
            mkdir $out
            cp -r CIncludes $out/include
            cp -r RIncludes $out/
          '' + (if stdenv.targetPlatform.system == "m68k-macos" then ''
            cp -r lib68k $out/lib
          '' else
            "");
        };


      import_libraries = with pkgs;
        if stdenvNoCC.targetPlatform.system != "m68k-macos" then
          stdenvNoCC.mkDerivation {
            name = "retro68.import_libraries";
            src = ../ImportLibraries;
            buildCommand = ''
              mkdir -p $out/lib
              cp $src/*.a $out/lib/
            '';
          }
        else
          null;

      libretro = with pkgs;
        let
          systemName = pkgs.targetPlatform.cmakeSystemName;
          toolchain = pkgs.writeTextFile {
            name = "retro68-cmake-toolchain-bootstrap";
            text = ''
              set(CMAKE_SYSTEM_NAME ${systemName})
              set(CMAKE_SYSTEM_VERSION 1)
              set(CMAKE_CROSSCOMPILING TRUE)
            '';
          };
        in (pkgs.stdenv.override {
          cc = stdenv.cc.override { extraPackages = [ ]; };
        }).mkDerivation {
          name = "libretro";
          src = ../libretro;

          nativeBuildInputs = [ buildPackages.cmake ];
          buildInputs = [ retro68.multiversal ];

          buildCommand = ''
            echo "Build command."
            cmake $src \
                    -DCMAKE_INSTALL_PREFIX=$out \
                    -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
                    -DCMAKE_BUILD_TYPE=Release \
                    -DCMAKE_TOOLCHAIN_FILE=${toolchain}
            cmake --build .
            cmake --build . --target install
          '';
        };

      console = with pkgs;
        stdenv.mkDerivation {
          name = "retro68.console";
          src = ../Console;

          nativeBuildInputs = [ buildPackages.cmake ];
        };

    });
} // prevPkgs.lib.optionalAttrs (prevPkgs.targetPlatform ? retro68) {

  # ----------- Binutils & GCC wrapped for nixpkgs -------------

  # binutils -- binutils with the wrappers provided by nixpkgs 
  binutils =
    pkgs.wrapBintoolsWith { bintools = pkgs.retro68.binutils_unwrapped; };

  # gcc -- gcc with the wrappers provided by nixpkgs
  gcc = pkgs.wrapCCWith {
    cc = pkgs.retro68.gcc_unwrapped;

    # don't allow nix to add options for hardening
    extraBuildCommands = ''
      echo "" > $out/nix-support/add-hardening.sh
    '';

    extraPackages = with pkgs.targetPackages.retro68; [
      multiversal
      import_libraries
      libretro
      setup_hook
    ];
  };

  # no separate libc package for now
  libcCrossChooser = name:
    if name == "retro68" then null else prevPkgs.libcCrossChooser name;

}
