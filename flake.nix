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

          retro68_gcc_m68k = with pkgs;
            stdenv.mkDerivation {
              name = "retro68_gcc_m68k";
              src = filterSrc (self + /gcc);
              buildInputs = [ retro68_binutils_m68k gmp mpfr libmpc ];
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
                ln -s ${retro68_binutils_m68k}/m68k-apple-macos/bin/* $out/m68k-apple-macos/bin/

                export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
                $src/configure "--target=m68k-apple-macos" "--enable-languages=c,c++" "--with-arch=m68k" "--with-cpu=m68000" "--disable-libssp" "MAKEINFO=missing" --prefix=$out
                make -j$NIX_BUILD_CORES
                make install
              '';
            };

          multiversal = with pkgs;
            stdenv.mkDerivation {
              name = "multiversal";
              src = multiversal_src;
              nativeBuildInputs =
                [ ruby retro68_gcc_m68k retro68_binutils_m68k ];
              buildCommand = ''
                echo $src
                build=`pwd`
                (cd $src && ruby make-multiverse.rb -G CIncludes -o "$build")
                mkdir $out
                cp -r CIncludes $out/
                cp -r lib68k $out/
              '';
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
                  "!/libelf"  # should perhaps use nixpkg's libelf instead?
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

          libretro_m68k = with pkgs;
            let
              #toolchainFile = retro68_gcc_m68k + "/m68k-apple-macos/cmake/retro68.toolchain.cmake";

              toolchainFile = writeText "toolchain.cmake" ''
                set( CMAKE_SYSTEM_NAME Retro68 )
                set( CMAKE_SYSTEM_VERSION 1)

                #set( REZ "@CMAKE_BINARY_DIR@/Rez/Rez" )
                #set( REZ_INCLUDE_PATH "${retro68_gcc_m68k}/RIncludes" )

                set( CMAKE_C_COMPILER "${retro68_gcc_m68k}/bin/m68k-apple-macos-gcc" )
                set( CMAKE_CXX_COMPILER "${retro68_gcc_m68k}/bin/m68k-apple-macos-g++" )

                set( CMAKE_C_STANDARD_INCLUDE_DIRECTORIES "${multiversal}/CIncludes" )
                set( CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES "${multiversal}/CIncludes" )

                list( APPEND CMAKE_MODULE_PATH "${self}/cmake" )

              '';
            in pkgs.stdenvNoCC.mkDerivation {
              name = "libretro_m68k";
              src = filterSrc (self + /libretro);

              nativeBuildInputs = with pkgs; [
                cmake
                gnumake
                retro68_gcc_m68k
                retro68_binutils_m68k
                multiversal
              ];

              buildCommand = ''
                echo "Build command."
                cmake $src \
                        -DCMAKE_TOOLCHAIN_FILE=${toolchainFile} \
                        -DCMAKE_INSTALL_PREFIX=$out \
                        -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
                        -DCMAKE_BUILD_TYPE=Release
                cmake --build .
                cmake --build . --target install
              '';

              # buildCommand = ''
              #   echo "Hello, world."
              #   #cmake $src -DCMAKE_MAKE_PROGRAM=${gnumake + "/bin/make"} -DCMAKE_TOOLCHAIN_FILE=${gcc_m68k + "/m68k-apple-macos/cmake/retro68.toolchain.cmake"}
              #   cmake --build .
              # '';
            };

        };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system})
          retro68_binutils_m68k retro68_gcc_m68k multiversal hfsutils
          libretro_m68k retro68_tools;
      });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage =
        forAllSystems (system: self.packages.${system}.retro68_gcc_m68k);
    };
}
