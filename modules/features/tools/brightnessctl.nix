{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "brightness" ]) {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
