{
  den.schema.syst = { lib, ... }: {
    options.systSettings.nixpkgs = {
      allowUnfree = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
}
