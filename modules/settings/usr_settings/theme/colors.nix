{
  den.aspects.users.base = { lib, ... }: {
    imports = [
      {
        options.usrSettings.theme.colors = lib.mkOption {
          type = lib.types.attrsOf lib.types.anything;
          default = {};
        };
      }
    ];
  };
}
