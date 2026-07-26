{ lib, ... }: {
  # note: putting arguments like `lib` into the aspect's arguments here will break
  # the `settings` option declaration
  den.aspects.utils.nix-ld = {
    # declare `settings` option which will generate a `settings` option on hosts mirroring
    # aspects' `settings` options via _settings_generator.nix, for modular, per-aspect settings
    settings = {
      # declare `libs` option in each host entity
      libs = lib.mkOption {
        # allow this to either be a list of packages, or a function with args `{ pkgs }` outputting
        # a list of packages (the latter is for when `pkgs` is not in scope when this option is set)
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
