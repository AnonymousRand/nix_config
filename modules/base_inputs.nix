{ inputs, ... }: {
  flake-file.inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";

    # (note that if using plain flake-parts, importing `inputs.home-manager.flakeModules.home-manager`
    # is required for integration of home manager for flake-parts (specifically `flake.homeModules`
    # and `flake.homeConfigurations`). doesn't seem to be needed for den)
    home-manager = {
      #url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager"; # if using unstable nixpkgs branch
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
