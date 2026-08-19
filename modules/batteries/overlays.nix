{ den, ... }: {
  den.quirks.quirks-overlays = {};

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-overlays = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in [
      (pipe.from "quirks-overlays" [ pipe.expose ])
    ];

  den.schema.user.includes = [ den.policies.aggregate-user-overlays ];

  # (putting `hostSettings` and `home` in class module args does break with "attribute missing")
  den.aspects.batteries.overlays = { hostSettings ? null, home ? null }: {
    nixos = { quirks-overlays, lib, ... }: {
      nixpkgs.overlays = lib.unique quirks-overlays;
    };

    homeManager = { quirks-overlays, lib, ... }:
      # only set `nixpkgs.overlays` in home manager class module if `useGlobalPkgs` was `false`
      # or if standalone (i.e. `home` present)! otherwise, this is not allowed
      lib.mkIf (home != null || !hostSettings.hmUseGlobalPkgs) {
        nixpkgs.overlays = lib.unique quirks-overlays;
      };
  };
}
