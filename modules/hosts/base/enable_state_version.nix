{
  den.schema.host = { lib, ... }: {
    options = {
      # required `stateVersion` option in each host entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.aspects.hosts.base = {
    nixos = { host, ... }: {
      system.stateVersion = host.stateVersion;
    };

    homeManager = { host, ... }: {
      home.stateVersion = host.stateVersion;
    };
  };
}
