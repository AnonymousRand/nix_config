{ den, ... }: {
  # create new `userSettings` context arg that duplicates either `host.userSettings` or
  # `home.userSettings`, so that other aspects can just receive a `userSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  den.policies.add-user-settings-ctx = { user ? null, home ? null, ... }:
    # we can't use `lib.optionals` since adding `lib` to the args above makes this policy never run
    if (user != null || home != null) then [
      # IMPORTANT: since this context arg might not always be defined, it *must* be passed as
      # an *aspect-level* arg (or parametrically as an inline aspect in `includes`), as if it's
      # in a class module arg list, nix will say "unknown attribute" instead of skipping
      (den.lib.policy.resolve {
        userSettings =
          if (user ? aspect && user.aspect ? userSettings) then
            user.aspect.userSettings // { username = user.name; }
          else (
            if (home ? aspect && home.aspect ? userSettings) then
              home.aspect.userSettings // { username = home.name; }
            else
              throw "policy `add-user-settings-ctx`: missing option values for `userSettings`!"
          );
      })
    ] else [];

  den.schema.user.includes = [ den.policies.add-user-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-user-settings-ctx ];
}
