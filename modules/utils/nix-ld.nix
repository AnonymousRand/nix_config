{ den, ... }:
let
  aspectName = "nix-ld";
in
{
  den.aspects.utils.${aspectName} = {
    nixos = { config, lib, ... }: {
      options.utils.${aspectName} = lib.mkOption {
        type = lib.types.submodule {
          options = {
            libs = lib.mkOption {
              type = lib.types.listOf lib.types.package;
              default = [];
            };
          };
        };

        default = {};
      };

      config =
        let
          nixosCfg = config.utils.${aspectName};
        in
        {
          programs.nix-ld = {
            enable = true;
            # make these libraries/binaries work with non-standard nix store filepaths
            libraries = nixosCfg.libs;
          };
        };
    };
  };
}
