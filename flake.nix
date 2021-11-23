{
  description = "Cross compilation toolchain for classic Macs";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/nixos-21.05";

  inputs.multiversal_src.url = "github:autc04/multiversal";
  inputs.multiversal_src.flake = false;

  outputs = { self, nixpkgs, multiversal_src }:
    let

      # System types to support.
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system:
        import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        });

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
        };
      };

    in {
      # A Nixpkgs overlay.
      overlay = pkgs: prev:
        let filterSrc = pkgs.nix-gitignore.gitignoreSource [ ];
        in {

          retro68_binutils_m68k = with pkgs;
            stdenv.mkDerivation rec {
              name = "retro68_binutils_m68k";
              src = filterSrc (self + /binutils);

              configureFlags = [ "--target=m68k-apple-macos" "--disable-doc" ];
              enableParallelBuilding = true;
            };

          retro68_binutils_m68k_with_tools = with pkgs;
            symlinkJoin {
              name = "retro68_buinutils_m68k_with_tools";
              paths = [ retro68_binutils_m68k buildPackages.retro68_tools ];

              # Move the real linker aside and install symlinks to Elf2Mac
              postBuild = ''
                mv $out/bin/m68k-apple-macos-ld $out/bin/m68k-apple-macos-ld.real
                mv $out/m68k-apple-macos/bin/ld $out/m68k-apple-macos/bin/ld.real
                ln -s $out/bin/Elf2Mac $out/bin/m68k-apple-macos-ld
                ln -s $out/bin/Elf2Mac $out/m68k-apple-macos/bin/ld
              '';
            };

          binutils = if pkgs.stdenv.targetPlatform.system == "m68k-macos" then
            pkgs.wrapBintoolsWith {
              bintools = pkgs.retro68_binutils_m68k_with_tools;
            }
          else
            prev.binutils;

          gcc = if pkgs.stdenv.targetPlatform.system == "m68k-macos" then
            pkgs.wrapCCWith {
              cc = pkgs.retro68_gcc_m68k;
              extraBuildCommands = ''
                echo "" > $out/nix-support/add-hardening.sh
              '';
              extraPackages = with pkgs.targetPackages; [ multiversal libretro ];
            }
          else
            prev.gcc;

          libcCrossChooser = name:
            if name == "retro68" then null else prev.libcCrossChooser name;

          retro68_gcc_m68k = with pkgs;
            stdenv.mkDerivation {
              name = "retro68_gcc_m68k";
              src = filterSrc (self + /gcc);
              buildInputs =
                [ retro68_binutils_m68k_with_tools gmp mpfr libmpc ];
              configureFlags = [
                "--target=m68k-apple-macos"
                "--enable-languages=c,c++"
                "--with-arch=m68k"
                "--with-cpu=m68000"
                "--disable-libssp"
                "MAKEINFO=missing"
              ];
              hardeningDisable = [ "format" ];
              enableParallelBuilding = true;

              # nix does in-source builds by default, and something breaks
              buildCommand = ''
                mkdir -p $out/m68k-apple-macos/bin
                ln -s ${retro68_binutils_m68k_with_tools}/m68k-apple-macos/bin/* $out/m68k-apple-macos/bin/

                export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
                $src/configure "--target=m68k-apple-macos" "--enable-languages=c,c++" "--with-arch=m68k" "--with-cpu=m68000" "--disable-libssp" "MAKEINFO=missing" --prefix=$out
                make -j$NIX_BUILD_CORES
                make install
              '';
            };

          multiversal = with pkgs;
            (pkgs.stdenv.override { cc = stdenv.cc.override { extraPackages = []; }; }).mkDerivation {
              name = "multiversal";
              src = multiversal_src;
              nativeBuildInputs = [ buildPackages.ruby ];
              buildCommand = ''
                echo $src
                build=`pwd`
                (cd $src && ruby make-multiverse.rb -G CIncludes -o "$build")
                mkdir $out
                cp -r CIncludes $out/include
                cp -r lib68k $out/lib
              '';
              meta = { platforms = [ "m68k-macos" ]; };
            };

          hfsutils = with pkgs;
            stdenv.mkDerivation {
              name = "hfsutils";
              srcs = filterSrc (self + /hfsutils);

              preConfigure = ''
                mkdir -p $out/bin
                mkdir -p $out/lib
                mkdir -p $out/include
                mkdir -p $out/share/man/man1
              '';
              configureFlags =
                [ "--mandir=$(out)/share/man" "--enable-devlibs" ];
            };
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
              ] self;

              nativeBuildInputs = [ cmake bison flex ];
              buildInputs = [ boost zlib hfsutils ];
            };

          libretro = with pkgs;
            (pkgs.stdenv.override { cc = stdenv.cc.override { extraPackages = []; }; }).mkDerivation {
              name = "libretro";
              src = filterSrc (self + /libretro);

              nativeBuildInputs = [ buildPackages.cmake ];
              buildInputs = [ multiversal ];

              buildCommand = ''
                echo "Build command."
                cmake $src \
                        -DCMAKE_INSTALL_PREFIX=$out \
                        -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
                        -DCMAKE_BUILD_TYPE=Release
                cmake --build .
                cmake --build . --target install
              '';
              meta = { platforms = [ "m68k-macos" ]; };
            };
        };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system: rec {
        inherit (nixpkgsFor.${system})
          retro68_binutils_m68k retro68_gcc_m68k multiversal hfsutils
          libretro_m68k retro68_tools;

        crossPkgs = (import nixpkgs { inherit system; }).lib.mapAttrs
          (name: plat:
            import nixpkgs {
              inherit system;
              overlays = [ self.overlay ];
              crossSystem = plat;
              config = { allowUnsupportedSystem = true; };
            }) retroSystems;

        crosstest = let pkgs = crossPkgs.m68k;
        in pkgs.stdenv.mkDerivation {
          name = "crosstest";
          meta = { platforms = [ "m68k-macos" ]; };
        };

        mingtest = let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlay ];
            crossSystem = { config = "x86_64-w64-mingw32"; };
          };
        in pkgs.stdenv.mkDerivation {
          name = "mingtest";
          meta = { platforms = pkgs.lib.platforms.all; };
        };
      });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage =
        forAllSystems (system: self.packages.${system}.retro68_gcc_m68k);
    };
}
