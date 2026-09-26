{
  den.aspects.features.tools.brightnessctl = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
