{
  den.aspects.features.apps.firefox = { systSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
      programs.firefox.enable = true;
    };
  };
}
