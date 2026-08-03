{ den, ... }: {
  # create new `username` context arg that duplicates either `user.name` or `home.name`, so that
  # other aspects can just use a `username` context arg to get the username regardless of if we
  # are building nixos or standalone home manager, instead of needing `user ? null, home ? null`
  den.policies.add-username-ctx = { user ? null, home ? null, ... }: [
    (den.lib.policy.resolve {
      username =
        if user ? name then
          user.name
        else (
          if home ? name then
            home.name
          else
            throw "policy `add-username-ctx`: missing option values for `username`!"
        );
    })
  ];

  den.schema.user.includes = [ den.policies.add-username-ctx ];
  den.schema.home.includes = [ den.policies.add-username-ctx ];
}
