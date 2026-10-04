{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    multiversal.url = "github:autc04/multiversal";
    multiversal.flake = false;
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, nixpkgs, multiversal, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ self, ... }: {
      imports = [
        ./nix/standalone.nix
      ];

      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          lib = pkgs.lib;
          retroPlatforms = (import ./nix/platforms.nix) { inherit lib; };

          crossShellInputs = cross: {
            nativeBuildInputs = with pkgs; [
              retro68.hfsutils
              retro68.tools
              cmake
              gnumake
              ninja
            ];
            buildInputs = [ cross.retro68.console ];
          };

          # development shell using the default (multiversal) interfaces
          crossShell = cross: cross.mkShell (crossShellInputs cross) // cross;

          # development shell using Apple's Universal Interfaces by default
          universalShell = cross:
            (cross.mkShell.override { stdenv = cross.stdenvUniversal; })
              (crossShellInputs cross) // cross;
        in
        {
          _module.args.pkgs = import nixpkgs { inherit system; overlays = [ self.overlays.default ]; };

          formatter = pkgs.nixpkgs-fmt;

          legacyPackages.pkgsCross = lib.mapAttrs
            (name: plat:
              import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
                crossSystem = plat;
                config = { 
                  allowUnsupportedSystem = true; 
                };
                stdenvStages = let 
                  realStdenvStages = import (nixpkgs + "/pkgs/stdenv");                  
                  in args@{crossSystem, ...}: realStdenvStages (args // { crossSystem = plat; });
              })
            retroPlatforms;

          devShells = {
            default = pkgs.mkShell {
              inputsFrom = [ pkgs.retro68.monolithic ];
              nativeBuildInputs = [ pkgs.nixpkgs-fmt ];
              hardeningDisable = [ "format" ];
              shellHook = ''
                export PATH="$PWD/build/toolchain/bin:$PATH"
              '';
            };
          } // lib.mapAttrs
            (name: cross: crossShell cross)
            self'.legacyPackages.pkgsCross
          // lib.mapAttrs'
            (name: cross: lib.nameValuePair "${name}-universal" (universalShell cross))
            self'.legacyPackages.pkgsCross;

          packages = {
            tools = pkgs.retro68.tools;
            hfsutils = pkgs.retro68.hfsutils;


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
          nixpkgs.lib.composeManyExtensions [
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
