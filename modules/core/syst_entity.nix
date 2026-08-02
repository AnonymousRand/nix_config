{ den, ... }: {
  # use `syst` entity type to encompass both hosts and homes (e.g. for capabilities)
  den.schema.host.imports = [ den.schema.syst ];
  den.schema.home.imports = [ den.schema.syst ];

  # create new `syst` context arg that duplicates either `host.core` or `home.core`, so that
  # other aspects can just receive a `syst` context arg instead of `host ? null, home ? null`
  den.policies.to-syst = { host ? null, home ? null, ... }: [
    (den.lib.policy.resolve.to "syst" {
      syst = {
        core =
          if host ? core then
            host.core
          else
            if home ? core then
              home.core
            else
              {};
      };
    })
  ];

  den.schema.host.includes = [ den.policies.to-syst ];
  den.schema.home.includes = [ den.policies.to-syst ];
}
