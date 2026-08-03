{ den, ... }: {
  # create new `core` context arg that duplicates either `host.core` or `home.core`, so that
  # other aspects can just receive a `core` context arg to get capabilities regardless of if
  # we are building nixos or standalone home manager, instead of needing `host ? null, home ? null`
  # (this never seems to work if i make the context arg `syst`; idk how to make entity kinds work lol)
  den.policies.add-core-ctx = { host ? null, home ? null, ... }: [
    (den.lib.policy.resolve {
      core =
        if host ? core then
          host.core
        else
          if home ? core then
            home.core
          else
            {};
    })
  ];

  # for some reason putting this into `den.schema.syst.includes` doesn't seem to work
  den.schema.host.includes = [ den.policies.add-core-ctx ];
  den.schema.home.includes = [ den.policies.add-core-ctx ];
}
