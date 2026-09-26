{
  den.schema.profile = { lib, ... }: {
    options.settings.desktop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          displayProtocol = lib.mkOption {
            type = lib.types.enum [ "wayland" "x11" ];
          };
        };
      };
    };
  };
}
