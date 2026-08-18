{ den, ... }: {
  # create new `usrSettings` context arg that duplicates either `host.usrSettings` or
  # `home.usrSettings`, so that other aspects can just receive a `usrSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  #
  # (this doesn't work if i make the context arg `usr`; idk how to make entity kinds work lol)
  # (also, note that we can't use add `lib` to these args, as that makes this policy never run)
  den.policies.add-usr-settings-ctx = { user ? null, home ? null, ... }: [
    # note that in practice, it seems impossible for both `user` and `home` to be `null`
    (den.lib.policy.resolve {
      usrSettings =
        if user ? usrSettings then
          user.usrSettings
        else (
          if home ? usrSettings then
            home.usrSettings
          else
            throw "den.policies.add-usr-settings-ctx: this shouldn't be possible!"
        );
    })
  ];

  # (for some reason putting this into `den.schema.usr.includes` breaks)
  den.schema.user.includes = [ den.policies.add-usr-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-usr-settings-ctx ];
}
