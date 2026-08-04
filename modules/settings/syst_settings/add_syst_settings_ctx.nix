{ den, ... }: {
  # create new `systSettings` context arg that duplicates either `host.systSettings` or
  # `home.systSettings`, so that other aspects can just receive a `systSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `host ? null, home ? null`
  # (this never seems to work if i make the context arg `syst`; idk how to make entity kinds work lol)
  den.policies.add-syst-settings-ctx = { host ? null, home ? null, ... }: [
    (den.lib.policy.resolve {
      systSettings =
        if host ? systSettings then
          host.systSettings
        else (
          if home ? systSettings then
            home.systSettings
          else
            throw "policy `add-syst-settings-ctx`: missing option values for `systSettings`!"
        );
    })
  ];

  # for some reason putting this into `den.schema.syst.includes` doesn't seem to work
  den.schema.host.includes = [ den.policies.add-syst-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-syst-settings-ctx ];
}
