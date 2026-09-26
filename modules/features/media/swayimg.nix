{
  den.aspects.features.media.swayimg = {
    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "media" ]) {
        programs.swayimg.enable = true;
      };
  };
}
