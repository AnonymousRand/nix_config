{ den, lib, ... }:
let
  aspectName = "nix-ld";
in
{
  den.aspects.batteries.${aspectName} = {
    aspOptions.batteries.${aspectName} = lib.mkOption {
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
    # >>then policy gathers aspConfig from all entity types, lib.mkMerge's them, puts them into
    # context as aspConfig?

    nixos = { aspConfig, lib, pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libraries/binaries work with non-standard nix store filepaths
        libraries = builtins.trace (builtins.length (aspConfig.batteries.nix-ld.libs pkgs)) aspConfig.batteries.${aspectName}.libs pkgs;
      };
    };
  };
}
