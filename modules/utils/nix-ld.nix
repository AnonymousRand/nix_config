let
  aspectName = "nix-ld";
in
{
  den.aspects.utils.${aspectName} = {
    nixos = { config, lib, ... }: {
      # declare these options in the nixos class module (aspect-level is weird)
      # set these options on any aspect that includes this :3
      options.${aspectName} = lib.mkOption {
        type = lib.types.submodule {
          options = {
            libs = lib.mkOption {
              type = lib.types.listOf lib.types.package;
              default = [];
            };
          };
        };
      };

      config = {
        programs.nix-ld = {
          enable = true;
          # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
          libraries = config.${aspectName}.libs;
        };
      };
    };
  };
}
