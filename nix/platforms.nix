{
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

    retro68GccConfig = [ "--with-arch=m68k" "--with-cpu=m68000" ];
    retro68 = true;
    cmakeSystemName = "Retro68";
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

    isStatic = true;
    retro68BinutilsConfig = [ "--disable-plugins" ];
    retro68GccConfig = [ "--disable-lto" ];
    retro68 = true;
    cmakeSystemName = "RetroPPC";
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
    isStatic = true;
    retro68BinutilsConfig = [ "--disable-plugins" ];
    retro68GccConfig = [ "--disable-lto" ];
    retro68 = true;
    cmakeSystemName = "RetroCarbon";
  };

  isStatic = true;
  retro68BinutilsConfig = [ "--disable-plugins" ];
  retro68GccConfig = [ "--disable-lto" ];
  retro68 = true;
}
