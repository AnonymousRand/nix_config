{
  den.aspects.features.media.swayimg = { systSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "media" ]) {
      programs.swayimg.enable = true;
    };
  };
}
