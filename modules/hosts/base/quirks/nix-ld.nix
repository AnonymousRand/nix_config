{
  den.aspects.hosts.base = {
    nixos = { nix-ld-libs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries = nix-ld-libs;
      };
    };
  };
}
