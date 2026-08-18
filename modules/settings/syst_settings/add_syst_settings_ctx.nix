{ den, ... }: {
  # create new `systSettings` context arg that duplicates either `host.systSettings` or
  # `home.systSettings`, so that other aspects can just receive a `systSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `host ? null, home ? null`
  # (this never seems to work if i make the context arg `syst`; idk how to make entity kinds work lol)
  den.policies.add-syst-settings-ctx = { host ? null, home ? null, ... }:
    # we can't use `lib.optionals` since adding `lib` to the args above makes this policy never run :/
    if (host != null || home != null) then [
      # note that the fact that this context arg might not be defined means it *must* be passed as
      # an *aspect-level* arg (or parametrically as an inline aspect in `includes`), as if it's in
      # a class module arg list, nix will say "unknown attribute" instead of skipping
      # (although technically i think it is impossible for it to not exist in this case?)
      (den.lib.policy.resolve {
        systSettings =
          if host ? systSettings then
            host.systSettings
          else (
            if home ? systSettings then
              home.systSettings
            else
              throw "den.policies.add-syst-settings-ctx: this shouldn't be possible!"
          );
      })
    ] else [];

  # (for some reason putting this into `den.schema.syst.includes` breaks)
  den.schema.host.includes = [ den.policies.add-syst-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-syst-settings-ctx ];
}
