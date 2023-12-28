pkgs: prevPkgs: {
  retro68 = prevPkgs.retro68.overrideScope' (self: prevRetro: {
    samples = with pkgs;
      let
        individualSamples = lib.mapAttrs
          (key: path:
            stdenv.mkDerivation {
              name = "retro68.samples." + key;
              src = path;
              nativeBuildInputs = [ buildPackages.ninja buildPackages.cmake ];
              buildInputs = [ retro68.console ];
              installPhase = ''
                mkdir $out
                cp *.bin $out/
                rm -f $out/*.code.bin $out/*.rsrc.bin
              '';
            })
          ({
            dialog = ../Samples/Dialog;
            helloworld = ../Samples/HelloWorld;
            raytracer = ../Samples/Raytracer;
          } // lib.optionalAttrs (targetPlatform.cmakeSystemName != "RetroCarbon") {
            mpwtool = ../Samples/MPWTool;
            wdef = ../Samples/WDEF;
          } // lib.optionalAttrs (targetPlatform.cmakeSystemName != "Retro68") {
            sharedlibrary = ../Samples/SharedLibrary;
          } // lib.optionalAttrs (targetPlatform.cmakeSystemName == "Retro68") {
            systemextension = ../Samples/SystemExtension;
            launcher = ../Samples/Launcher;
          }) // { launchapplserver = self.launchapplserver; };
      in
      runCommand "retro68.samples" { } ''
        mkdir -p $out/

        ${lib.concatMapStrings (x: ''
          cp -r ${lib.escapeShellArg x}/*.bin $out/
        '') (builtins.attrValues individualSamples)}
      '' // individualSamples;

    launchapplserver = with pkgs;
      stdenvUniversal.mkDerivation {
        name = "retro68.launchapplserver";
        src = ../LaunchAPPL;
        nativeBuildInputs = [ buildPackages.ninja buildPackages.cmake ];
        installPhase = ''
          mkdir $out
          cp Server/*.bin $out/
          rm $out/*.code.bin $out/*.rsrc.bin
        '';
      };
  });
}
