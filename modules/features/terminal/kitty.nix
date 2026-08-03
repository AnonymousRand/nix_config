{
  den.aspects.features.terminal.kitty = {
    homeManager = { core, lib, ... }:
      lib.optionalAttrs (core.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
