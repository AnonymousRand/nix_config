{
  den.aspects.features.apps.firefox = {
    homeManager = { syst, lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "graphics" ]) {
        programs.firefox.enable = true;
      };
  };
}
