{ den, lib, ... }: {
  den.schema.host = {
    options.settings.adminUsers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
  };

  # note that passing in `lib` here at aspect level seems to fail
  den.aspects.host-settings.admin-users = { host }: {
    provides = lib.genAttrs host.settings.adminUsers (
      username: {
        includes = [ den.batteries.primary-user ];
      }
    );
  };
}
