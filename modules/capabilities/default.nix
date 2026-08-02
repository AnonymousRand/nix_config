{
  den.schema.host = { host, lib, ... }: {
    options = {
      # helper function for aspects to easily determine if a host has the required capabilities
      capabilities.has = lib.mkOption {
        type = lib.types.functionTo lib.types.bool;
        readOnly = true;
        default = capabilities:
          builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
          true capabilities;
      };
    };
  };
}
