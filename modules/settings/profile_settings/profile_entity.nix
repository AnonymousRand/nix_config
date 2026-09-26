# use `profile` entity type to encompass both users and homes (currently for `settings` options)

{ den, lib, ... }: {
  options.den.profiles = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.profile ];
        config._module.args.profile = config;
      }
    ));

    default = {};
  };

  config = {
    den.schema.profile.isEntity = true;

    den.policies.user-to-profile = { user, ... }: [
      (den.lib.policy.resolve.shared.to "profile" {
        profile = lib.mkMerge [ user (den.profiles.${user.name} or {}) ];
      })
    ];

    den.policies.home-to-profile = { home, ... }: [
      (den.lib.policy.resolve.shared.to "profile" {
        profile = lib.mkMerge [ home (den.profiles.${home.userName} or {}) ];
      })
    ];

    den.schema.user.includes = [ den.policies.user-to-profile ];
    den.schema.home.includes = [ den.policies.home-to-profile ];
  };
}
