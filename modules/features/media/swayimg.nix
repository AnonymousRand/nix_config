{
  den.aspects.features.media.swayimg = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" "media" ]) {
        programs.swayimg.enable = true;
      };
  };
}
