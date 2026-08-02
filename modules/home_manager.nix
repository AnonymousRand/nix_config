{ inputs, ... }: {
  flake-file.inputs = {
    home-manager = {
      #url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager"; # if using unstable nixpkgs branch
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    # integration of home manager for flake-parts; doesn't seem to be needed for den? (i think
    # it exposes `flake.homeModules` and `flake.homeConfigurations`, neither of which den uses)
    #inputs.home-manager.flakeModules.home-manager
  ];
}
