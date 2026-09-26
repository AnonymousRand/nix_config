{
  den.aspects.features.tools.playerctl = {
    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
