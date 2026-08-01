{ den, ... }: {
  den.quirks.nix-ld-libs = {};

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-nix-ld = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in
    [ (pipe.from "nix-ld-libs" [ pipe.expose ]) ];

  den.schema.user.includes = [ den.policies.aggregate-user-nix-ld ];
}
