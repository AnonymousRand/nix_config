let
  capabilityName = "inputs";
in
{
  den.schema.systm = { lib, ... }: {
    options.settings.capabilities.${capabilityName} = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          keyboard_devices = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "list of keyboard devices as absolute path strings to `/dev/input/`";
          };

          input_group_users = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description =
              "list of users to assign the `input` group (e.g. for using `evtest`). "
              + "TRUSTED USERS ONLY!";
          };
        };
      };
    };
  };

  den.aspects.syst-settings.capabilities = {
    nixos = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ capabilityName ]) {
        users.users =
          lib.genAttrs syst.settings.capabilities.${capabilityName}.input_group_users (user: {
            extraGroups = [ "input" ];
          });
      };
  };
}
