{
  den.aspects.features.apps.firefox = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        programs.firefox.enable = true;
      };
  };
}
