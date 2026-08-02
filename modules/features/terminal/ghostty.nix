{
  den.aspects.features.terminal.ghostty = {
    homeManager = { syst, lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "graphics" ]) {
        programs.ghostty.enable = true;
      };
  };
}
