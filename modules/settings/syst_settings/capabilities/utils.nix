{
  den.schema.syst = { config, lib, ... }: {
    options.systSettings.capabilities = {
      # helper function for aspects to easily determine if a host has the required capabilities
      has = lib.mkOption {
        type = lib.types.functionTo lib.types.bool;
        readOnly = true;
        default = capabilities:
          builtins.foldl' (acc: new: acc && config.systSettings.capabilities.${new}.supported)
          true capabilities;
      };
    };
  };
}
