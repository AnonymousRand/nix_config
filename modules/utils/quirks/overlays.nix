{ den, ... }: {
  den.quirks.overlays = {};

  den.schema.host = { lib, ... }: {
    options.quirks.overlays = lib.mkOption {
      type = lib.type.submodule {
        options = {
          hmUseGlobalPkgs = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
        };
      };
    };
  };

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-overlays = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in
    [ (pipe.from "overlays" [ pipe.expose ]) ];

  den.schema.user.includes = [ den.policies.aggregate-user-overlays ];
}
