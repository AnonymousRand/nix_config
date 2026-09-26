{
  den.aspects.features.tools.brightnessctl = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
