{
  den.schema.user = { lib, ... }: {
    options.settings.theme.colors = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
  };
}
