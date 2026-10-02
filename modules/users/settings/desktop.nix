{
  den.schema.user = { lib, ... }: {
    options.settings.desktop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          displayProtocol = lib.mkOption {
            type = lib.types.nullOr (lib.types.enum [ "wayland" "x11" ]);
            default = null;
          };
        };
      };
    };
  };
}
