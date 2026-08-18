{
  den.schema.usr = { lib, ... }: {
    options.usrSettings = {
      username = lib.mkOption {
        type = lib.types.str;
      };
    };
  };
}
