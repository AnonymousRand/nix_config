{ den, ... }: {
  # declare custom options/set default options for all host entities, as metadata used for aspects
  den.schema.host = { host, lib, ... }: {
    options = {
      # required `stateVersion` option in each host entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };

      # optional `nixLdLibs` option in each host entity for nix-ld
      nixLdLibs = lib.mkOption {
        type = lib.types.functionTo (lib.types.listOf lib.types.package);
        default = [];
      };
    };

    config = {
      # change default aspect name associated with host entities to fit our naming scheme
      aspect = den.aspects.hosts.${host.name};

      # only put things that are directly related to the options above here!
      includes = [
        # nix-ld
        # TODO make sure this works! if not, include in aspect instead
        den.aspects.utils.nix-ld
      ];
    };
  };
}
