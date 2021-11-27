{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }
, ... }:

let
  retroSystems = {
    m68k = {
      system = "m68k-macos";
      config = "m68k-apple-macos";
      libc = "retro68";
      parsed = {
        cpu = {
          name = "m68k";
          bits = 32;
          significantByte = { name = "bigEndian"; };
          family = "m68k";
        };
        kernel = {
          name = "macos";
          execFormat = { name = "unknown"; };
        };
      };
      bfdEmulation = "m68k";
      isStatic = true;

      retro68GccConfig = [ "--with-arch=m68k" "--with-cpu=m68000" ];
      retro68 = true;
      cmakeSystemName = "Retro68";
    };
    powerpc = {
      system = "powerpc-macos";
      config = "powerpc-apple-macos";
      libc = "retro68";
      parsed = {
        cpu = {
          name = "powerpc";
          bits = 32;
          significantByte = { name = "bigEndian"; };
          family = "power";
        };
        kernel = {
          name = "macos";
          execFormat = { name = "unknown"; };
        };
      };

      isStatic = true;
      retro68BinutilsConfig = [ "--disable-plugins" ];
      retro68GccConfig = [ "--disable-lto" ];
      retro68 = true;
      cmakeSystemName = "RetroPPC";
    };
    carbon = {
      system = "powerpc-carbon";
      config = "powerpc-apple-carbon";
      libc = "retro68";
      parsed = {
        cpu = {
          name = "powerpc";
          bits = 32;
          significantByte = { name = "bigEndian"; };
          family = "power";
        };
        kernel = {
          name = "carbon";
          execFormat = { name = "unknown"; };
        };
      };
      cmakeSystemName = "RetroCarbon";
    };

    isStatic = true;
    retro68BinutilsConfig = [ "--disable-plugins" ];
    retro68GccConfig = [ "--disable-lto" ];
    retro68 = true;
  };

  # A Nixpkgs overlay.
  overlay = pkgs: prev:
    {
      # ----------- Native Tools -------------

      # hfsutils -- Utilities for manipulating HFS volumes & disk images.
      hfsutils = with pkgs;
        stdenv.mkDerivation {
          name = "hfsutils";
          srcs = ./hfsutils;

          preConfigure = ''
            mkdir -p $out/bin
            mkdir -p $out/lib
            mkdir -p $out/include
            mkdir -p $out/share/man/man1
          '';
          configureFlags = [ "--mandir=$(out)/share/man" "--enable-devlibs" ];
        };

      # retro68_tools -- native tools that are part of Retro68
      retro68_tools = with pkgs;
        stdenv.mkDerivation {
          name = "retro68_tools";
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
          ] ./.;

          nativeBuildInputs = [ cmake bison flex ];
          buildInputs = [ boost zlib hfsutils ];
        };

      # ----------- Binutils & GCC -------------

      # retro68_binutils -- binutils, without any wrappers
      retro68_binutils = with pkgs;
        stdenv.mkDerivation rec {
          name = "retro68_binutils";
          src = ./binutils;

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

      # retro68_gcc -- gcc, without any wrappers
      retro68_gcc = with pkgs;
        stdenv.mkDerivation rec {
          name = "retro68_gcc";
          src = ./gcc;
          buildInputs = [ retro68_binutils gmp mpfr libmpc ];
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
            ln -s ${retro68_binutils}/${stdenv.targetPlatform.config}/bin/* $out/${stdenv.targetPlatform.config}/bin/

            export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
            $src/configure ${builtins.toString configureFlags} --prefix=$out
            make -j$NIX_BUILD_CORES
            make install
          '';
        };

      # ----------- Binutils & GCC wrapped for nixpkgs -------------

      # binutils -- binutils with the wrappers provided by nixpkgs 
      binutils = if pkgs.stdenv.targetPlatform ? retro68 then
        pkgs.wrapBintoolsWith { bintools = pkgs.retro68_binutils; }
      else
        prev.binutils;

      # gcc -- gcc with the wrappers provided by nixpkgs
      gcc = if pkgs.stdenv.targetPlatform ? retro68 then
        pkgs.wrapCCWith {
          cc = pkgs.retro68_gcc;

          # don't allow nix to add options for hardening
          extraBuildCommands = ''
            echo "" > $out/nix-support/add-hardening.sh
          '';

          extraPackages = with pkgs.targetPackages; [
            multiversal
            import-libraries
            libretro
            retro68_setup_hook
          ];
        }
      else
        prev.gcc;

      # no separate libc package for now
      libcCrossChooser = name:
        if name == "retro68" then null else prev.libcCrossChooser name;

      retro68_setup_hook = let
        systemName = pkgs.targetPlatform.cmakeSystemName;
        toolchain = pkgs.writeTextFile {
          name = "retro68-cmake-toolchain";
          text = ''
            set(CMAKE_SYSTEM_NAME ${systemName})
            set(CMAKE_SYSTEM_VERSION 1)
            set(CMAKE_CROSSCOMPILING TRUE)

            set( REZ "${pkgs.buildPackages.retro68_tools}/bin/Rez" )
            set(REZ_TEMPLATES_PATH ${pkgs.libretro}/RIncludes)

            include(${./cmake/add_application.cmake})
          '';
        };
        hook = pkgs.writeTextFile {
          name = "retro68_setup_hook";
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
            export RETRO68_LD_WRAPPER_Retro68="${pkgs.buildPackages.retro68_tools}/bin/Elf2Mac"
            export RETRO68_REAL_LD="${pkgs.buildPackages.retro68_binutils}/bin/m68k-apple-macos-ld.real"
          '');
        };
      in pkgs.makeSetupHook { } hook;

      # ----------- Retro68 core libraries -------------

      # multiversal -- multiversal interfaces
      multiversal = with pkgs;
        (stdenv.override {
          cc = stdenv.cc.override { extraPackages = [ ]; };
        }).mkDerivation {
          name = "multiversal";
          src = ./multiversal;
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
          '' else ''
          '');
          meta = { platforms = [ "m68k-macos" ]; };
        };

      import-libraries = with pkgs;
        if stdenvNoCC.targetPlatform != retroSystems.m68k
        then stdenvNoCC.mkDerivation {
          name = "import-libraries";
          src = ./ImportLibraries;
          buildCommand = ''
            mkdir -p $out/lib
            cp $src/*.a $out/lib/
          '';
        }
        else null;

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
          src = ./libretro;

          nativeBuildInputs = [ buildPackages.cmake ];
          buildInputs = [ multiversal ];

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
          meta = { platforms = [ "m68k-macos" ]; };
        };
    };

  pkgs = import <nixpkgs> {
    inherit system;
    overlays = [ overlay ];
  };

  crossPkgs = pkgs.lib.mapAttrs (name: plat:
    import <nixpkgs> {
      inherit system;
      overlays = [ overlay ];
      crossSystem = plat;
      config = { allowUnsupportedSystem = true; };
    }) retroSystems;

  shell = pkgs.lib.mapAttrs (name: cross:
    cross.mkShell {
      nativeBuildInputs =
        [ pkgs.hfsutils pkgs.retro68_tools pkgs.cmake pkgs.gnumake ];
    }) crossPkgs;

  in {
    inherit overlay crossPkgs shell;
  }
