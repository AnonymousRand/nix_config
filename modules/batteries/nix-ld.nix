{ den, ... }: {
  den.quirks.quirks-nix-ld = {};

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-nix-ld = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in [
      (pipe.from "quirks-nix-ld" [ pipe.expose ])
    ];

  den.schema.user.includes = [ den.policies.aggregate-user-nix-ld ];

  den.aspects.batteries.nix-ld = {
    nixos = { quirks-nix-ld, lib, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libraries/binaries work with non-standard nix store filepaths
        libraries = quirks-nix-ld;
      };
    };
  };
}
