{
  den.aspects.features.media.swayimg = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "graphics" "media" ]) {
        programs.swayimg.enable = true;
      };
  };
}
