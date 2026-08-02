{
  den.aspects.features.terminal.kitty = {
    homeManager = { syst, lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
