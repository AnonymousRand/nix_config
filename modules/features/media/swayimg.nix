{
  den.aspects.features.media.swayimg = {
    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "media" ]) {
        programs.swayimg.enable = true;
      };
  };
}
