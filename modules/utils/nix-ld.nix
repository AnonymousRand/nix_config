{
  den.aspects.utils.nix-ld = {
    nixos = { host, pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
        # make these libs (e.g. installed through `pip`) work with non-standard nix store filepaths
        libraries = host.nixLdLibs { inherit pkgs; };
      };
    };
  };
}
