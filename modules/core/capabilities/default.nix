{
  den.schema.syst = { config, lib, ... }: {
    options.core.capabilities = {
      # helper function for aspects to easily determine if a host has the required capabilities
      has = lib.mkOption {
        type = lib.types.functionTo lib.types.bool;
        readOnly = true;
        default = capabilities:
          builtins.foldl' (acc: new: acc && config.core.capabilities.${new}.supported)
          true capabilities;
      };
    };
  };
}
