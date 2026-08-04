{
  den.aspects.features.tools.playerctl = { systSettings }: {
    homeManager = { lib, pkgs, ... }: lib.mkIf (systSettings.capabilities.has [ "media" ]) {
      home.packages = [
        pkgs.playerctl
      ];
    };
  };
}
