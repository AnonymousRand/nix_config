{
  den.aspects.features.terminal.ghostty = {
    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        programs.ghostty.enable = true;
      };
  };
}
