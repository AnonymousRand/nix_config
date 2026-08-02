{
  den.aspects.features.terminal.kitty = {
    homeManager = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "graphics" ]) {
      programs.kitty.enable = true;
    };
  };
}
