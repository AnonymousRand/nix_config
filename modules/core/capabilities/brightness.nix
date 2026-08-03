let
  capabilityName = "brightness";
in
{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.${capabilityName} = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
        };
      };
    };
  };
}
