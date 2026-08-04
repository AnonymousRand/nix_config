{ den, ... }: {
  # create new `userSettings` context arg that duplicates either `host.userSettings` or
  # `home.userSettings`, so that other aspects can just receive a `userSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  den.policies.add-user-settings-ctx = { user ? null, home ? null, lib, ... }:
    # note that the fact that this context arg might not be defined means it *must* be passed as
    # an *aspect-level* arg, as if it's in a class module arg list, nix will say "unknown attribute"
    # instead of skipping
    lib.optionals (user != null || home != null) [
      (den.lib.policy.resolve {
        userSettings =
          if (lib.hasAttrByPath [ "aspect" "userSettings" ] user) then
            user.aspect.userSettings
          else (
            if (lib.hasAttrByPath [ "aspect" "userSettings" ] home) then
              home.aspect.userSettings
            else
              throw "policy `add-user-settings-ctx`: missing option values for `userSettings`!"
          );
      })
    ];

  den.schema.user.includes = [ den.policies.add-user-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-user-settings-ctx ];
}
