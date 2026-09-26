{
  den.aspects.features.apps.firefox = {
    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.firefox.enable = true;
      };
  };
}
