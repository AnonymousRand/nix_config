# use `profile` entity type to encompass both users and homes (currently for `settings` options)

{ den, lib, ... }: {
  options.den.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      { name, config, ... }: {
        freeformType = lib.types.attrsOf lib.types.anything;
        imports = [ den.schema.user ];
        config._module.args.user = config;

        options = {
          name = lib.mkOption {
            type = lib.types.str;
            default = name;
            description = "User name (from attrset key)";
          };

          userName = lib.mkOption {
            type = lib.types.str;
            default = name;
            description = "User account name";
          };

          classes = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ "user" ];
            description = "Home management nix classes";
          };

          aspect = lib.mkOption {
            type = lib.types.raw;
            default = if den.aspects ? ${name} then den.aspects.${name} else { };
            defaultText = "den.aspects.<name>";
            description = "Aspect that configures this user";
          };
        };
      }
    ));

    default = {};
  };

  config = {
    # promote users to real entities
    den.schema.user.isEntity = true;

    den.policies.host-to-tl-users = { host, ... }:
      map (user: den.lib.policy.resolve.to "user" {
        inherit host;
        user = builtins.trace "host ${host.name} user ${user.name}" den.users.${user.name};
      }) (lib.attrValues host.users);

    den.policies.home-to-tl-users = { home, ... }: [
      (
        den.lib.policy.resolve.to "user" {
          inherit home;
          user = den.users.${home.userName};
        }
      )
    ];

    den.schema.host.includes = [ den.policies.host-to-tl-users ];
    den.schema.host.excludes = [ den.policies.host-to-users ];
    den.schema.home.includes = [ den.policies.home-to-tl-users ];
  };
}
