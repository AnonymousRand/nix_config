{
  den.quirks.nix-ld-libs = {
    decription = "Libraries to patch with `nix-ld`";
  };

  den.aspects.system.nix-ld = {
    nixos = { nix-ld-libs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries = nix-ld-libs;
      };
    };
  };
}
