{ den, ... }: {
  # create new `profileSettings` context arg that duplicates either `host.profileSettings` or
  # `home.profileSettings`, so that other aspects can just receive a `profileSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  #
  # (this doesn't work if i make the context arg `profile`; idk how to make entity kinds work lol)
  # (also, note that we can't add `lib` to these args, as that makes this policy never run)
  den.policies.add-profile-settings-ctx = { user ? null, home ? null, ... }: [
    # note that in practice, it seems impossible for both `user` and `home` to be `null`
    (den.lib.policy.resolve {
      profileSettings =
        if (user ? profileSettings) then
          user.profileSettings
        else (
          if (home ? profileSettings) then
            home.profileSettings
          else
            throw "den.policies.add-profile-settings-ctx: this shouldn't be possible!"
        );
    })
  ];

  # (for some reason putting this into `den.schema.profile.includes` breaks)
  den.schema.user.includes = [ den.policies.add-profile-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-profile-settings-ctx ];
}
