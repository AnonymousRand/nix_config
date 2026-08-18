{
  den.schema.syst = { lib, ... }: {
    options.systSettings = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { systSettings, ... }: {
      system.stateVersion = systSettings.stateVersion;
    };

    homeManager = { systSettings, ... }: {
      home.stateVersion = systSettings.stateVersion;
    };
  };
}
