{
  den.aspects.features.tools.playerctl = {
    # note: if this doesn't work, try `services.playerctld.enable` and/or services.mpris-proxy.enable`
    homeManager = { syst, lib, pkgs, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "media" ]) {
        home.packages = [
          pkgs.playerctl
        ];
      };
  };
}
