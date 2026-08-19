{ den, lib, ... }: {
  den.aspects.batteries.nix-ld = {
    aspOptions.batteries.nix-ld = lib.mkOption {
      type = lib.types.submodule {
        options = {
          libs = lib.mkOption {
            type = lib.types.functionTo (lib.types.listOf lib.types.package);
            default = _: [];
          };
        };
      };
    };

    # generator takes all aspOptions inside aspects and declares them in den.schema.conf, under
    # options.aspConfig
    # then policy gathers aspConfig from all entity types, lib.mkMerge's them, puts them into
    # context as aspConfig?

    nixos = { user, lib, pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libraries/binaries work with non-standard nix store filepaths
        libraries = user.aspConfig.batteries.nix-ld.libs pkgs;
      };
    };
  };
}
