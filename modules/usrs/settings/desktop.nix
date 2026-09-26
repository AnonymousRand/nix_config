{
  den.schema.profile = { lib, ... }: {
    options.profileSettings.desktop = lib.mkOption {
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
