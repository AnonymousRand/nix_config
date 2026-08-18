{
  den.schema.usr = { lib, ... }: {
    options.usrSettings.theme.colors = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
  };
}
