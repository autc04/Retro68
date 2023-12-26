{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    multiversal.url = "github:autc04/multiversal";
    multiversal.flake = false;
  };

  outputs = inputs@{ flake-parts, nixpkgs, multiversal, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ self, lib, retroPlatforms, ... }: {
      _module.args.lib = import (nixpkgs + "/lib");
      _module.args.retroPlatforms = import ./nix/platforms.nix;

      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        {
          _module.args.pkgs = import nixpkgs { inherit system; overlays = [ self.overlays.default ]; };

          legacyPackages.crossPkgs = lib.mapAttrs
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
            self'.legacyPackages.crossPkgs;


        };
      flake = {
        overlays.default =
          lib.composeManyExtensions [
            ((import nix/overlay.nix) { multiversal_src = multiversal; })
            (import nix/universal.nix)
            (import nix/samples.nix)
          ];
      };
    });
}
