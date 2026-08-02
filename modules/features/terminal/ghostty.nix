{
  den.aspects.features.terminal.ghostty = {
    homeManager = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      programs.ghostty.enable = true;
    };
  };
}
