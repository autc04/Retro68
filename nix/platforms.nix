{ lib }: 
let
  inspect = lib.systems.inspect;
  elaborate = systemDict:
    systemDict // lib.mapAttrs (n: v: v systemDict) inspect.predicates
    // { 
      uname = { system = "MacOS"; processor = systemDict.parsed.cpu.name; release = null; }; 
      rust = {rustcTarget = systemDict.config; rustcTargetSpec = systemDict.config; };
      go = {};
      node = {};
      useiOSPrebuilt = false;
      useAndroidPrebuilt = false;
      linker = "bfd";
      libdir = null;
      extensions = {
        staticLibarary = ".a";
        library = ".a";
        executable = "";
      };
      hasSharedLibraries = false;
      useLLVM = false;
    };
in {
  m68k = elaborate {
    system = "m68k-macos";
    config = "m68k-apple-macos";
    libc = null;
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
      vendor = { name = "apple"; };
      abi = { name = "macos"; };
    };
    bfdEmulation = "m68k";
    isStatic = true;

    retro68GccConfig = [ "--with-arch=m68k" "--with-cpu=m68000" ];
    retro68 = true;
    cmakeSystemName = "Retro68";
  };
  powerpc = elaborate {
    system = "powerpc-macos";
    config = "powerpc-apple-macos";
    libc = null;
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
      vendor = { name = "apple"; };
      abi = { name = "macos"; };
    };

    isStatic = true;
    retro68BinutilsConfig = [ "--disable-plugins" ];
    retro68GccConfig = [ "--disable-lto" ];
    retro68 = true;
    cmakeSystemName = "RetroPPC";
  };
  carbon = elaborate {
    system = "powerpc-carbon";
    config = "powerpc-apple-macos";
    libc = null;
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
      vendor = { name = "apple"; };
      abi = { name = "macos"; };
    };
    isStatic = true;
    retro68BinutilsConfig = [ "--disable-plugins" ];
    retro68GccConfig = [ "--disable-lto" ];
    retro68 = true;
    cmakeSystemName = "RetroCarbon";
  };
}
