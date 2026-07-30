{ den, ... }: {
  den.quirks.nix-ld = {};

  den.schema.host.includes = [
    {
      nixos = { nix-ld, ... }: {
        programs.nix-ld = {
          enable = true;
          # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
          libraries = nix-ld.libs
        };
      };
    }
  ];
}
