{
  den.aspects.features.tools.playerctl = {
    homeManager = { core, lib, pkgs, ... }:
      lib.optionalAttrs (core.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
