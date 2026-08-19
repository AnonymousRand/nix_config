{
  den.schema.profile = { lib, ... }: {
    options.profileSettings.theme.colors = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
  };
}
