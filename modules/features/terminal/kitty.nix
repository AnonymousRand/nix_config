{
  den.aspects.features.terminal.kitty = {
    homeManager = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
