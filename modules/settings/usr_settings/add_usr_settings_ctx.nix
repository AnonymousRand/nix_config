{ den, ... }: {
  # create new `usrSettings` context arg that duplicates either `host.usrSettings` or
  # `home.usrSettings`, so that other aspects can just receive a `usrSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  den.policies.add-usr-settings-ctx = { user ? null, home ? null, ... }:
    # we can't use `lib.optionals` since adding `lib` to the args above makes this policy never run
    if (user != null || home != null) then [
      # IMPORTANT: since this context arg might not always be defined, it *must* be passed as
      # an *aspect-level* arg (or parametrically as an inline aspect in `includes`), as if it's
      # in a class module arg list, nix will say "unknown attribute" instead of skipping
      (den.lib.policy.resolve {
        usrSettings =
          if user ? usrSettings then
            user.usrSettings
          else (
            if home ? usrSettings then
              user.usrSettings
            else
              throw "den.policies.add-usr-settings-ctx: missing option values for `usrSettings`!"
          );
      })
    ] else [];

  # TODO test:
  # (for some reason putting this into `den.schema.syst.includes` causes infinite recursion)
  den.schema.user.includes = [ den.policies.add-usr-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-usr-settings-ctx ];
}
