{
  den.schema.syst = { lib, ... }: {
    options.systSettings = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.syst-settings.state-version = { systSettings }: {
    nixos = {
      system.stateVersion = systSettings.stateVersion;
    };

    homeManager = {
      home.stateVersion = systSettings.stateVersion;
    };
  };
}
