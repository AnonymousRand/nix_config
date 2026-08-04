{ den, ... }: {
  den.aspects.features.tools.brightnessctl = { systSettings }: {
    homeManager = { lib, pkgs, ... }: lib.mkIf (systSettings.capabilities.has [ "brightness" ]) {
      home.packages = [
        pkgs.brightnessctl
      ];
    };
  };
}
