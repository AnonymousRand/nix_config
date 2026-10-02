# use `profile` entity type to encompass both users and homes (currently for `settings` options)

{ den, lib, ... }: {
  options.den.profiles = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.profil ];
        config._module.args.profil = config;
      }
    ));

    default = {};
  };

  config = {
    # need this to "register" the entity kind
    den.schema.profil = {};

    den.policies.user-to-profile = { user, ... }: [
      (den.lib.policy.resolve {
        # (`lib.mkMerge`ing the profile and the user/home doesn't seem to work, hence profile only)
        profile = den.profiles.${user.name} or {};
      })
    ];

    den.policies.home-to-profile = { home, ... }: [
      (den.lib.policy.resolve {
        profile = den.profiles.${home.userName} or {};
      })
    ];

    den.schema.user.includes = [ den.policies.user-to-profile ];
    den.schema.home.includes = [ den.policies.home-to-profile ];
  };
}
