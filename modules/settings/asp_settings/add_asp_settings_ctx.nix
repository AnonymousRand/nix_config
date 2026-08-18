{ den, lib, ... }: {
  den.reservedKeys = [ "aspOptions" "aspConfig" ];

  # create new `aspSettings` context arg that duplicates either `host.aspSettings` or
  # `home.aspSettings`, so that other aspects can just receive a `aspSettings` context arg
  # to get settings regardless of if we are building nixos or standalone home manager,
  # instead of needing `user ? null, home ? null`
  #
  # (also, note that we can't add `lib` to these args, as that makes this policy never run)
  den.policies.add-asp-settings-ctx = { host, ... }:
  builtins.trace "${builtins.concatStringsSep ", " (builtins.attrNames den.aspects.utils.nix-ld)}" [
    (den.lib.policy.resolve {
    })
  ];

  den.schema.conf.includes = [ den.policies.add-asp-settings-ctx ];
}
