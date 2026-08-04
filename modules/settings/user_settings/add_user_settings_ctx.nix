{ den, ... }: {
  # create new `userSettings` context arg that duplicates either `host.userSettings` or
  # `home.userSettings`, so that other aspects can just receive a `userSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  den.policies.add-user-settings-ctx = { user ? null, home ? null, lib, ... }: [
    (den.lib.policy.resolve {
      userSettings =
        if (lib.hasAttrByPath [ "aspect" "userSettings" ] user) then
          user.aspect.userSettings // { username = user.name; }
        else (
          if (lib.hasAttrByPath [ "aspect" "userSettings" ] home) then
            home.aspect.userSettings // { username = home.name; }
          else
            throw "policy `add-user-settings-ctx`: missing option values for `userSettings`!"
        );
    })
  ];

  den.schema.user.includes = [ den.policies.add-user-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-user-settings-ctx ];
}
