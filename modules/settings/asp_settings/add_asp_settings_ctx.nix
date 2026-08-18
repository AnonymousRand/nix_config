{ den, ... }: {
  den.classes.aspOptions = {};

  # create new `aspSettings` context arg that duplicates either `host.aspSettings` or
  # `home.aspSettings`, so that other aspects can just receive a `aspSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  #
  # (also, note that we can't use add `lib` to these args, as that makes this policy never run)
  den.policies.add-asp-settings-ctx = { host, ... }:
  builtins.trace "${builtins.concatStringsSep ", " (builtins.attrNames den.aspects.hosts.base)}" [
    (den.lib.policy.resolve {
    })
  ];

  den.schema.host.includes = [ den.policies.add-asp-settings-ctx ];
  den.schema.user.includes = [ den.policies.add-asp-settings-ctx ];
  den.schema.home.includes = [ den.policies.add-asp-settings-ctx ];
}
