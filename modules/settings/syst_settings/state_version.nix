{
  den.schema.syst = { lib, ... }: {
    options.systSettings = {
      # required `stateVersion` option in each host and home entity
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
