{ den, ... }: {
  # create new `hostSettings` context arg that duplicates `host.hostSettings`, so that
  # other aspects can just receive a `hostSettings` context arg to get settings, consistent
  # with `hostSettings` etc
  den.policies.add-host-settings-ctx = { host, ... }: [
    (den.lib.policy.resolve {
      hostSettings = host.hostSettings;
    })
  ];

  den.schema.host.includes = [ den.policies.add-host-settings-ctx ];
}
