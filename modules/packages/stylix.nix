{ inputs, ... }: {
  flake.nixosModules.stylix = { pkgs, ... }: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];

    #stylix = {
    #  enable = true;
    #  # default fallback config since apparently stylix has to be enabled globally
    #  # for `home-manager.useGlobalPkgs = true` to work correctly
    #  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    #};
  };
}
