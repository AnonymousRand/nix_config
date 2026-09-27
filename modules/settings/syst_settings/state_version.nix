{
  den.schema.systm = { lib, ... }: {
    options.settings.stateVersion = lib.mkOption {
      type = lib.types.str;
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { syst, ... }: {
      system.stateVersion = syst.settings.stateVersion;
    };

    # `provides.to-users` seems to be needed here
    provides.to-users = {
      homeManager = { syst, ... }: {
        home.stateVersion = syst.settings.stateVersion;
      };
    };
  };
}
