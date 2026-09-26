{
  den.schema.syst = { lib, ... }: {
    options.settings = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.syst-settings.state-version = {
    nixos = { syst, ... }: {
      system.stateVersion = syst.settings.stateVersion;
    };

    homeManager = { syst, ... }: {
      home.stateVersion = syst.settings.stateVersion;
    };
  };
}
