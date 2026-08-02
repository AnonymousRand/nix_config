{ den, ... }: {
  den.quirks.overlays = {};

  den.schema.host = { lib, ... }: {
    options.quirks.overlays = lib.mkOption {
      type = lib.types.submodule {
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

  den.aspects.core.quirks.overlays = {
    nixos = { host, overlays, lib, ... }: {
      nixpkgs.overlays = lib.unique overlays;

      # allows home manager to see `nixpkgs` overlays if this is `true`
      home-manager.useGlobalPkgs = lib.mkForce host.quirks.overlays.hmUseGlobalPkgs;
    };

    homeManager = { host ? null, overlays, lib, ... }:
      # only set `nixpkgs.overlays` in home manager class module if `useGlobalPkgs` was `false`
      # or if standalone (i.e. no `host`)! otherwise, this is not allowed
      lib.optionalAttrs (host == null || !host.quirks.overlays.hmUseGlobalPkgs) {
        nixpkgs.overlays = lib.unique overlays;
      };
  };
}
