{
  den.aspects.features.theme.gtk = { systSettings, userSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
      gtk = {
        enable = true;
        font = {
          name = builtins.head (userSettings.theme.fonts.defaults.sansSerif or [ "" ]);
        };
      };
    };
  };
}
