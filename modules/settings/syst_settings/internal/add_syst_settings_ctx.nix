{ den, ... }: {
  # create new `systSettings` context arg that duplicates either `host.systSettings` or
  # `home.systSettings`, so that other aspects can just receive a `systSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `host ? null, home ? null`
  #
  # (also, note that we can't add `lib` to these args, as that makes this policy never run)
  den.policies.add-syst-settings-ctx = { host ? null, home ? null, ... }: [
    # note that in practice, it seems impossible for both `host` and `home` to be `null`
    (den.lib.policy.resolve {
      # note: we can't name this `syst` as that conflicts with the entity kind; that's also why
      # we currently don't just set it to `host` or `home` instead of their `.systSettings`
      systSettings =
        if (host ? systSettings) then
          host.systSettings
        else (
          if (home ? systSettings) then
            home.systSettings
          else
            throw "den.policies.add-syst-settings-ctx: this shouldn't be possible!"
        );
    })
  ];

  # (for some reason putting this into `den.schema.syst.includes` breaks)
  den.schema.host.includes = [ den.policies.add-syst-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-syst-settings-ctx ];
}
