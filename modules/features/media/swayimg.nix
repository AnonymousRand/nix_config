{
  den.aspects.features.media.swayimg = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "media" ]) {
        programs.swayimg.enable = true;
      };
  };
}
