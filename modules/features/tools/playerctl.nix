{
  den.aspects.features.tools.playerctl = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
