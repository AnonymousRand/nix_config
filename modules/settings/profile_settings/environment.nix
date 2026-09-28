{
  den.schema.profil = { lib, ... }: {
    options.settings.environment = lib.mkOption {
      type = lib.types.submodule {
        options = {
          displayProtocol = lib.mkOption {
            type = lib.types.nullOr (lib.types.enum [ "wayland" "x11" ]);
            default = null;
          };

          shell = lib.mkOption {
            type = lib.types.nullOr (lib.types.str);
            default = null;
          };
        };
      };
    };
  };
}
