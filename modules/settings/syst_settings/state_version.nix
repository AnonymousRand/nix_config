{
  den.schema.syst = { lib, ... }: {
    options.settings= {
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { systSettings, ... }: {
      system.stateVersion = systSettings.settings.stateVersion;
    };

    homeManager = { systSettings, ... }: {
      home.stateVersion = systSettings.settings.stateVersion;
    };
  };
}
