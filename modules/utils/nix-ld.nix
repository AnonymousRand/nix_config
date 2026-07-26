{ lib, ... }: {
  # note: putting arguments like `lib` into the aspect's arguments here will break
  # the `settings` option declaration
  den.aspects.utils.nix-ld = {
    settings = {
      # declare `libs` option in each host entity
      libs = lib.mkOption {
        type = lib.types.either
          (lib.types.listOf lib.types.package)
          lib.types.raw;
        default = [];
      };
    };

    nixos = { host, pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries =
          let
            libs = host.settings.utils.nix-ld.libs;
          in
          if (builtins.isFunction libs) then
            libs { inherit pkgs; }
          else
            libs;
      };
    };
  };
}
