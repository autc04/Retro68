pkgs: prevPkgs: {
  retro68 = prevPkgs.retro68.overrideScope' (self: prevRetro: {
    samples = with pkgs;
      let
        individualSamples = lib.mapAttrs (key: path:
          stdenv.mkDerivation {
            name = "retro68.samples." + key;
            src = path;
            nativeBuildInputs = [ buildPackages.ninja buildPackages.cmake ];
            buildInputs = [ retro68.console ];
            buildCommand = ''
              mkdir build
              cd build
              cmake $src -G Ninja
              ninja
              mkdir -p $out/Applications
              mkdir -p $out/Applications/.finf
              mkdir -p $out/Applications/.rsrc

              cp *.APPL $out/Applications
              cp .finf/*.APPL $out/Applications/.finf
              cp .rsrc/*.APPL $out/Applications/.rsrc
              for f in *.APPL; do
                cp $'' + ''
                {f%.APPL}.bin $out/Applications
                                  done
                                '';
          }) ({
            dialog = ../Samples/Dialog;
            helloworld = ../Samples/HelloWorld;
            mpwtool = ../Samples/MPWTool;
            raytracer = ../Samples/Raytracer;
            #systemextension = ../Samples/SystemExtension;
            wdef = ../Samples/WDEF;
          } // lib.optionalAttrs (targetPlatform.cmakeSystemName != "Retro68") {
            sharedlibrary = ../Samples/SharedLibrary;
          } // lib.optionalAttrs (targetPlatform.cmakeSystemName == "Retro68") {
            launcher = ../Samples/Launcher;
          });
      in runCommand "retro68.samples" { } ''
        mkdir -p $out/Applications
        mkdir -p $out/Applications/.rsrc
        mkdir -p $out/Applications/.finf

        ${lib.concatMapStrings (x: ''
          cp -r ${lib.escapeShellArg x}/Applications $out/
        '') (builtins.attrValues individualSamples)}
      '' // individualSamples;

    launchapplserver = with pkgs;
      stdenvUniversal.mkDerivation {
        name = "retro68.launchapplserver";
        src = ../LaunchAPPL;
        nativeBuildInputs = [ buildPackages.ninja buildPackages.cmake ];
        installPhase = ''
          mkdir $out
          mkdir -p $out/Applications
          mkdir -p $out/Applications/.finf
          mkdir -p $out/Applications/.rsrc

          cp Server/LaunchAPPLServer.APPL $out/Applications
          cp Server/.finf/LaunchAPPLServer.APPL $out/Applications/.finf
          cp Server/.rsrc/LaunchAPPLServer.APPL $out/Applications/.rsrc
          cp Server/LaunchAPPLServer.bin $out/Applications
        '';
      };
  });
}
