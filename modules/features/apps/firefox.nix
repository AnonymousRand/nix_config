{
  den.aspects.features.apps.firefox = {
    homeManager = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      programs.firefox.enable = true;
    };
  };
}
