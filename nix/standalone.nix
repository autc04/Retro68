# flake part to add a 'standalone' build of retro68 for all archs,
# i.e. a build that does not rely on nixpkgs's wrapper setup.
# this might be what should be put into a docker image.

# Warning: does not yet work.

{ ... }: {
  perSystem = { self', pkgs, ... }: {
    packages.standalone = pkgs.runCommand "Retro68" { } ''
      mkdir -p $out/m68k-apple-macos/cmake
      mkdir -p $out/powerpc-apple-macos/cmake
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

      substitute ${../cmake/retro68.toolchain.cmake.in} $out/m68k-apple-macos/cmake/retro68.toolchain.cmake --subst-var-by RETRO68_ROOT $out
      substitute ${../cmake/retroppc.toolchain.cmake.in} $out/powerpc-apple-macos/cmake/retroppc.toolchain.cmake --subst-var-by RETRO68_ROOT $out
      substitute ${../cmake/retrocarbon.toolchain.cmake.in} $out/powerpc-apple-macos/cmake/retrocarbon.toolchain.cmake --subst-var-by RETRO68_ROOT $out
      cp ${../cmake/add_application.cmake} $out/m68k-apple-macos/cmake/add_application.cmake
      cp -r ${../cmake/Platform} $out/m68k-apple-macos/cmake/Platform
      cp -r ${../cmake/Platform} $out/powerpc-apple-macos/cmake/Platform
    '';
  };
}
