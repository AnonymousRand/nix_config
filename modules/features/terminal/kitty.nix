{
  den.aspects.features.terminal.kitty = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ "graphics" ]) {
        programs.kitty.enable = true;
      };
  };
}
