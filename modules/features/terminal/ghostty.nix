{
  den.aspects.features.terminal.ghostty = {
    homeManager = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        programs.ghostty.enable = true;
      };
  };
}
