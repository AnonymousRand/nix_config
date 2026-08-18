{
  den.aspects.features.terminal.kitty = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
