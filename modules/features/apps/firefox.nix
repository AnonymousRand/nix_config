{
  den.aspects.features.apps.firefox = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
      homeManager = {
        programs.firefox.enable = true;
      };
    };
}
