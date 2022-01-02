{ system ? builtins.currentSystem, nixpkgs ? <nixpkgs>
, ... }:

let
  retroPlatforms = import nix/platforms.nix;

  lib = ((import <nixpkgs>) {}).lib;
  # A Nixpkgs overlay.
  overlay = lib.composeManyExtensions [
    (import nix/overlay.nix)
    (import nix/universal.nix)
    (import nix/samples.nix)
  ];
    
  overlaidPkgs = import nixpkgs {
    inherit system;
    overlays = [ overlay ];
  };

  crossPkgs = overlaidPkgs.lib.mapAttrs (name: plat:
    import nixpkgs {
      inherit system;
      overlays = [ overlay ];
      crossSystem = plat;
      config = { allowUnsupportedSystem = true; };
    }) retroPlatforms;

  shell = overlaidPkgs.lib.mapAttrs (name: cross:
    cross.mkShell {
      nativeBuildInputs = with overlaidPkgs; [
        retro68.hfsutils
        retro68.tools
        cmake
        gnumake
      ];
      buildInputs = [ cross.retro68.console ];
    } // cross) crossPkgs;

in shell.m68k // shell // {
  inherit overlay;
  inherit (overlaidPkgs) retro68;
}
