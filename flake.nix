{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    multiversal.url = "github:autc04/multiversal";
    multiversal.flake = false;
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, nixpkgs, multiversal, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ self, lib, retroPlatforms, ... }: {
      _module.args.lib = import (nixpkgs + "/lib");
      _module.args.retroPlatforms = import ./nix/platforms.nix;

      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        {
          _module.args.pkgs = import nixpkgs { inherit system; overlays = [ self.overlays.default ]; };

          formatter = pkgs.nixpkgs-fmt;

          legacyPackages.pkgsCross = lib.mapAttrs
            (name: plat:
              import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
                crossSystem = plat;
                config = { allowUnsupportedSystem = true; };
              })
            retroPlatforms;

          devShells = {
            default = pkgs.mkShell {
              inputsFrom = [ pkgs.retro68.monolithic ];
              nativeBuildInputs = [ pkgs.nixpkgs-fmt ];
              hardeningDisable = [ "format" ];
            };
          } // lib.mapAttrs
            (name: cross:
              cross.mkShell
                {
                  nativeBuildInputs = with pkgs; [
                    retro68.hfsutils
                    retro68.tools
                    cmake
                    gnumake
                    ninja
                  ];
                  buildInputs = [ cross.retro68.console ];
                } // cross)
            self'.legacyPackages.pkgsCross;

          packages = {
            tools = pkgs.retro68.tools;
            hfsutils = pkgs.retro68.hfsutils;

            default = pkgs.runCommand "Retro68" { } ''
              mkdir $out
              mkdir $out/m68k-apple-macos
              mkdir $out/powerpc-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.m68k.retro68.libretro}/. $out/m68k-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.m68k.retro68.multiversal}/. $out/m68k-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.powerpc.retro68.libretro}/. $out/powerpc-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.powerpc.retro68.multiversal}/. $out/powerpc-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.carbon.retro68.libretro}/. $out/powerpc-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${self'.legacyPackages.pkgsCross.carbon.retro68.multiversal}/. $out/powerpc-apple-macos
              ${pkgs.xorg.lndir}/bin/lndir -silent ${pkgs.retro68.tools}/. $out
              ${pkgs.xorg.lndir}/bin/lndir -silent ${pkgs.retro68.hfsutils}/. $out
              ${pkgs.xorg.lndir}/bin/lndir -silent ${pkgs.cmake}/. $out
              ${pkgs.xorg.lndir}/bin/lndir -silent ${pkgs.gnumake}/. $out
              ${pkgs.xorg.lndir}/bin/lndir -silent ${pkgs.ninja}/. $out

              ${pkgs.rsync}/bin/rsync -a ${self'.legacyPackages.pkgsCross.m68k.buildPackages.retro68.gcc_unwrapped}/. $out
              ${pkgs.rsync}/bin/rsync -a ${self'.legacyPackages.pkgsCross.powerpc.buildPackages.retro68.gcc_unwrapped}/. $out
              ${pkgs.rsync}/bin/rsync -a ${self'.legacyPackages.pkgsCross.carbon.buildPackages.retro68.gcc_unwrapped}/. $out
            '';

            samples = pkgs.linkFarm "Retro68-Samples" [
              { name = "m68k"; path = self'.legacyPackages.pkgsCross.m68k.retro68.samples; }
              { name = "powerpc"; path = self'.legacyPackages.pkgsCross.powerpc.retro68.samples; }
              { name = "carbon"; path = self'.legacyPackages.pkgsCross.carbon.retro68.samples; }
            ];
          } // lib.mapAttrs'
            (name: cross: lib.nameValuePair "samples-${name}" cross.retro68.samples)
            self'.legacyPackages.pkgsCross;
        };
      flake = {
        overlays.default =
          lib.composeManyExtensions [
            ((import nix/overlay.nix) {
              multiversal_src =
                if builtins.pathExists ./multiversal/make-multiverse.rb
                then ./multiversal
                else multiversal;
            })
            (import nix/universal.nix)
            (import nix/samples.nix)
          ];
      };
    });
}
