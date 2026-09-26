{
  den.schema.profile = { lib, ... }: {
    options.settings.theme.colors = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
  };
}
