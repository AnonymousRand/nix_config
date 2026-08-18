{ den, ... }: {
  den.quirks.nix-ld-libs = {};

  # automatically forward/aggregate all user-provided quirk data to hosts
  den.policies.aggregate-user-nix-ld = { host, user, ... }:
    let inherit (den.lib.policy) pipe; in
    [ (pipe.from "nix-ld-libs" [ pipe.expose ]) ];

  den.schema.user.includes = [ den.policies.aggregate-user-nix-ld ];

  den.aspects.syst-settings.nix-ld = {
    nixos = { nix-ld-libs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries = nix-ld-libs;
      };
    };
  };
}
