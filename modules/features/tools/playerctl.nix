{
  den.aspects.features.tools.playerctl = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
