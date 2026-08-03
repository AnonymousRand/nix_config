{
  den.aspects.features.terminal.ghostty = {
    homeManager = { core, lib, ... }:
      lib.optionalAttrs (core.capabilities.has [ "graphics" ]) {
        programs.ghostty.enable = true;
      };
  };
}
