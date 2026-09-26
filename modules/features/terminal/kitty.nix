{
  den.aspects.features.terminal.kitty = {
    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
