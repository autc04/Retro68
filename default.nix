let sources = import ./nix/sources.nix;
in { system ? builtins.currentSystem, nixpkgs ? sources.nixpkgs, ... }:

let
  retroPlatforms = import nix/platforms.nix;

  lib = ((import nixpkgs) { inherit system; }).lib;

  multiversal_src = if builtins.pathExists ./multiversal/make-multiverse.rb then
    ./multiversal
  else
    sources.multiversal;

  # A Nixpkgs overlay.
  overlay = lib.composeManyExtensions [
    ((import nix/overlay.nix) { inherit multiversal_src; })
    (import nix/universal.nix)
    (import nix/samples.nix)
  ];

  overlaidPkgs = import nixpkgs {
    inherit system;
    overlays = [ overlay ];
  };

  crossPkgs = lib.mapAttrs (name: plat:
    import nixpkgs {
      inherit system;
      overlays = [ overlay ];
      crossSystem = plat;
      config = { allowUnsupportedSystem = true; };
    }) retroPlatforms;

  shell = lib.mapAttrs (name: cross:
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
