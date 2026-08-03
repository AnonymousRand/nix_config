{
  den.aspects.features.tools.playerctl = {
    homeManager = { core, lib, pkgs, ... }:
      lib.mkIf (core.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
