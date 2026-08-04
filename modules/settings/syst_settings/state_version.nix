{
  den.schema.syst = { lib, ... }: {
    options.systSettings = {
      # required `stateVersion` option in each host and home entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { host, ... }: {
      system.stateVersion = host.systSettings.stateVersion;
    };

    homeManager = { systSettings, lib, ... }: {
      home.stateVersion = systSettings.stateVersion;
    };
  };
}
