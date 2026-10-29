{
  den.aspects.features.media.satty = {
    homeManager = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "media" ]) {
        programs.satty.enable = true;
      };
  };
}
