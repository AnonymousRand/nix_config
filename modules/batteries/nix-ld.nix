{ den, ... }: {
  den.reservedKeys = [ "aspOptions" ];
  den.aspects.batteries.nix-ld = { lib, ... }: {
    aspOptions.aspSettings = lib.mkOption {
      type = lib.types.anything;
    };

    # generator takes all aspOptions inside aspects and declares them in den.schema.conf, under
    # options
    # then policy gathers aspSettings from all entity types, lib.mkMerge's them, puts them into
    # context as aspSettings?

    nixos = { lib, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libraries/binaries work with non-standard nix store filepaths
        #libraries = quirks-nix-ld;
      };
    };
  };
}
