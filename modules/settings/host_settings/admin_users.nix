{ den, lib, ... }: {
  den.schema.host = {
    options.hostSettings.adminUsers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
  };

  # note that passing in `lib` here at aspect level seems to fail
  den.aspects.host-settings.admin-users = { hostSettings }: {
    provides = lib.genAttrs hostSettings.adminUsers (
      username: {
        includes = [ den.batteries.primary-user ];
      }
    );
  };
}
