{
  den.schema.host = { lib, ... }: {
    options = {
      # required `stateVersion` option in each host entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  den.schema.home = { lib, ... }: {
    options = {
      # required `stateVersion` option in each home entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };
    };
  };

  # TODO ok so like this just isn't getting called at all with home-manager
  den.aspects.core.state-version = { host ? null, home ? null }: {
    nixos = { host, ... }: {
      system.stateVersion = host.stateVersion;
    };

    #homeManager = { host, ... }: {
    #  home.stateVersion = host.stateVersion;
    #};

    homeManager = {
      home.stateVersion = "26.05";
    };

    #homeManager = { lib, ... }:
    #  let
    #    homeCtx = home;
    #  in
    #  {
    #    home.stateVersion =
    #      if host ? stateVersion then
    #        host.stateVersion
    #      else
    #        if homeCtx ? stateVersion then
    #          homeCtx.stateVersion
    #        else
    #          lib.mkDefault "";
    #  };
  };
}
