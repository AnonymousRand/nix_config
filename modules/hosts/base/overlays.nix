{ den, ... }: {
  den.quirks.overlays = {};

  # allow users to provide data to this same quirk and aggregate from all users on the host
  den.policies.aggregate-user-overlays = { user, host, ... }:
    let inherit (den.lib.policy) pipe; in [
      (pipe.from "overlays" [ pipe.expose ])
    ];

  den.schema.user.includes = [
    den.policies.aggregate-user-overlays
  ];

  # consume all overlays from quirk
  den.aspects.hosts.base = {
    nixos = { overlays, lib, ... }: {
      nixpkgs.overlays = lib.unique overlays;
    };
  };
}
