{ den, lib, ... }: {
  den.aspects.batteries.nix-ld = builtins.trace "1" {
    #aspOptions.batteries.nix-ld = builtins.trace "declaring" lib.mkOption {
    #  type = lib.types.listOf lib.types.package;
    #  default = [];
    #};

    settings = builtins.trace "declaring 2" {
      libs = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [];
      };
    };

    # generator takes all aspOptions inside aspects and declares them in den.schema.conf, under
    # options.aspConfig
    # then policy gathers aspConfig from all entity types, lib.mkMerge's them, puts them into
    # context as aspConfig?

    nixos = { user, lib, ... }: builtins.trace "2" {
      programs.nix-ld = {
        enable = true;
        # make these libraries/binaries work with non-standard nix store filepaths
        libraries = user.settings.batteries.nix-ld.libs;
      };
    };
  };
}
