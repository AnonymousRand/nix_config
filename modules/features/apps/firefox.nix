{
  den.aspects.features.apps.firefox = {
    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        programs.firefox.enable = true;
      };
  };
}
