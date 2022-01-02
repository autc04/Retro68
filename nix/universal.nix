pkgs: prevPkgs:
{
  retro68 = if !(prevPkgs.hostPlatform ? retro68) then
    prevPkgs.retro68
  else
    prevPkgs.retro68.overrideScope' (self: prevRetro: {

      mpw_35_gm = with pkgs;
        fetchurl {
          url =
            "https://web.archive.org/web/20210309154524/https://staticky.com/mirrors/ftp.apple.com/developer/Tool_Chest/Core_Mac_OS_Tools/MPW_etc./MPW-GM_Images/MPW-GM.img.bin";
          sha256 = "0wm8dwmm0cpp8px27in564ih27sn5vbydz3jqpzwh04qpfazmfwr";
        };

      universal = with pkgs;
        stdenvNoCC.mkDerivation {
          name = "retro68.universal";
          src = retro68.mpw_35_gm;
          nativeBuildInputs = with buildPackages.retro68; [
            tools
            hfsutils
            binutils_unwrapped
          ];

          buildCommand = ''
            ConvertDiskImage $src decoded.dsk
            export HOME=.
            hmount decoded.dsk
            mkdir -p CIncludes RIncludes lib68
            hcopy -t 'MPW-GM:MPW-GM:Interfaces&Libraries:Interfaces:CIncludes:*.h' CIncludes/
            hcopy -t 'MPW-GM:MPW-GM:Interfaces&Libraries:Interfaces:RIncludes:*.r' RIncludes/
            mkdir -p $out/include $out/RIncludes
            bash ${../prepare-headers.sh} CIncludes $out/include
            bash ${../prepare-rincludes.sh} RIncludes $out/RIncludes

            hcopy -r 'MPW-GM:MPW-GM:Interfaces&Libraries:Libraries:Libraries:*.o' lib68

            . ${../interfaces-and-libraries.sh}
            M68KLIBRARIES=lib68
            setup68KLibraries $out/
            mv $out/lib68k $out/lib
          '';
        };
    });
} // prevPkgs.lib.optionalAttrs (prevPkgs.targetPlatform ? retro68) {

  stdenvUniversal = pkgs.stdenv.override {
    cc = pkgs.stdenv.cc.override {
      extraPackages = with pkgs.retro68; [
        universal
        import_libraries
        libretro
        setup_hook
      ];
    };
  };

}
