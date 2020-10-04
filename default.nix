{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }
, ... }:

pkgs.callPackage ({ 
    stdenv, cmake, ninja, bison, flex,ruby, boost, gmp, mpfr, libmpc, zlib,
    lib, bash }:

  stdenv.mkDerivation {
    name = "retro68";
    nativeBuildInputs = [ cmake bison ruby flex ];
    buildInputs = [
      boost
      gmp
      mpfr
      libmpc
      zlib
      bash
    ];
    src = if lib.inNixShell then null else pkgs.nix-gitignore.gitignoreSource [ ] ./.;
  
    builder = ./nix/builder.sh;

    hardeningDisable = ["all"];
  }
  
  
  ) { }
