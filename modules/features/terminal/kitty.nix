{
  den.aspects.features.terminal.kitty = { systSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
      programs.kitty.enable = true;
    };
  };
}
