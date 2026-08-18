{ den, ... }: {
  # create new `usrSettings` context arg that duplicates either `host.usrSettings` or
  # `home.usrSettings`, so that other aspects can just receive a `usrSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  den.policies.add-user-settings-ctx = { user ? null, home ? null, ... }:
    # we can't use `lib.optionals` since adding `lib` to the args above makes this policy never run
    if (user != null || home != null) then [
      # IMPORTANT: since this context arg might not always be defined, it *must* be passed as
      # an *aspect-level* arg (or parametrically as an inline aspect in `includes`), as if it's
      # in a class module arg list, nix will say "unknown attribute" instead of skipping
      (den.lib.policy.resolve {
        usrSettings =
          if (user ? aspect && user.aspect ? usrSettings) then
            user.aspect.usrSettings // { username = user.name; }
          else (
            if (home ? aspect && home.aspect ? usrSettings) then
              home.aspect.usrSettings // { username = home.name; }
            else
              throw "policy `add-user-settings-ctx`: missing option values for `usrSettings`!"
          );
      })
    ] else [];

  den.schema.user.includes = [ den.policies.add-user-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-user-settings-ctx ];
}
