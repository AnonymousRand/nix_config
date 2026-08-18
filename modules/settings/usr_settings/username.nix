{
  den.schema.usr = { lib, ... }: {
    options.usrSettings = {
      username = lib.mkOption {
        type = lib.types.str;
        # TODO test if can take a user ? home arg here and set default to user.name or home.name
      };
    };
  };
}
