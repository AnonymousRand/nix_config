{ den, ... }: {
  den.quirks.overlays = {};

  den.schema.host = { host, lib, ... }: {
    options = {
      # required `hmUseGlobalPkgs` option in each host entity
      hmUseGlobalPkgs = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  den.aspects.utils.quirks.overlays = {
    nixos = { host, overlays, lib, ... }: {
      nixpkgs.overlays = lib.unique overlays;

      # allows home manager to see `nixpkgs` overlays if this is `true`
      home-manager.useGlobalPkgs = lib.mkForce host.hmUseGlobalPkgs;
    };

    homeManager = { host, overlays, lib, ... }:
      # only set `nixpkgs.overlays` in home manager class module if `useGlobalPkgs` was `false`
      # (which includes if home manager is standalone)! otherwise, this is not allowed
      lib.mkIf (!host.hmUseGlobalPkgs) {
        nixpkgs.overlays = lib.unique overlays;
      };
  };

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-overlays = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in
    [ (pipe.from "overlays" [ pipe.expose ]) ];

  den.schema.user.includes = [ den.policies.aggregate-user-overlays ];
}
