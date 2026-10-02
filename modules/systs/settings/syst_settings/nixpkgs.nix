{
  den.schema.systm = { lib, ... }: {
    options.settings.nixpkgs = {
      allowUnfree = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
}
