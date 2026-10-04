# IMPORTANT: keep the output names updated if you ever change the HDMI/DP ports that they plug into

let
  capabilityName = "graphics";
in
{
  den.schema.systm = { lib, ... }: {
    options.settings.capabilities.${capabilityName} = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          displayOutputs = lib.mkOption {
            # the attrset keys should be the output names (e.g. "HDMI-A-1" or "DP-4")
            type = lib.types.attrsOf (lib.types.submodule {
              options = {
                resolution = lib.mkOption {
                  type = lib.types.submodule {
                    options.width  = lib.mkOption { type = lib.types.int; };
                    options.height = lib.mkOption { type = lib.types.int; };
                  };
                };

                refreshRate = lib.mkOption {
                  type = lib.types.float;
                };

                scale = lib.mkOption {
                  type = lib.types.float;
                };

                position = lib.mkOption {
                  type = lib.types.submodule {
                    options.x = lib.mkOption { type = lib.types.int; };
                    options.y = lib.mkOption { type = lib.types.int; };
                  };
                };
              };
            });

            default = {};
          };
        };
      };
    };
  };
}
