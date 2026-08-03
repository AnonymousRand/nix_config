{
  den.aspects.features.apps.firefox = {
    homeManager = { core, lib, ... }:
      lib.optionalAttrs (core.capabilities.has [ "graphics" ]) {
        programs.firefox.enable = true;
      };
  };
}
