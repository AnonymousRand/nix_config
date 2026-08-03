{
  den.schema.syst = { lib, ... }: {
    options.core = {
      # required `stateVersion` option in each host and home entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.core.state-version = {
    nixos = { host, ... }: {
      system.stateVersion = host.core.stateVersion;
    };

    homeManager = { core, lib, ... }: {
      home.stateVersion = core.stateVersion;
    };
  };
}
