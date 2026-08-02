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

  # note: optional `host` and `home` args have to be at the aspect-level for this to be called?
  # and it only happens when both args are put down
  den.aspects.core.state-version = { host ? null, home ? null }: {
    nixos = { host, ... }: {
      system.stateVersion = host.stateVersion;
    };

    homeManager = { lib, ... }:
      let
        homeCtx = home;
      in
      {
        home.stateVersion =
          if host ? stateVersion then
            host.stateVersion
          else
            if homeCtx ? stateVersion then
              homeCtx.stateVersion
            else
              lib.mkDefault "";
      };
  };
}
