{
  flake.nixosModules.desktopConfig = { pkgs, ... }: {
    programs.nix-ld = {
      enable = true;
      # make these libraries (e.g. installed through `pip`) work with nix store's non-standard filepaths
      libraries = [
        pkgs.uv
      ];
    };
  };
}
