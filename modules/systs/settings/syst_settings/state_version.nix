{
  den.schema.systm = { lib, ... }: {
    # this should be kept as the nixos release version of the first install of this system!
    options.settings.stateVersion = lib.mkOption {
      type = lib.types.str;
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { syst, ... }: {
      system.stateVersion = syst.settings.stateVersion;
    };

    # `provides.to-users` seems to be needed here; TODO check
    provides.to-users = {
      homeManager = { syst, ... }: {
        home.stateVersion = syst.settings.stateVersion;
      };
    };
  };
}
