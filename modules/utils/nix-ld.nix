{ lib, ... }: {
  # note: putting arguments like `lib` into the aspect's arguments here will break
  # the `settings` option declaration
  den.aspects.utils.nix-ld = { config, lib, ... }: {
    imports = [
      {
        # declare these aspect-level options (requires the `imports` above to work)
        # set these options on any aspect that includes this :3
        options = {
          libs = lib.mkOption {
            # this should be a function accepting exactly the argument `{ pkgs }` and outputting
            # a list of packages
            type = lib.types.functionTo (lib.types.listOf lib.types.package);
            default = { pkgs }: [];
          };
        };
      }
    ];

    nixos = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries = config.libs { inherit pkgs; };
      };
    };
  };
}
