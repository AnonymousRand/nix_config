{ inputs, ... }: {
  flake-file.inputs = {
    home-manager = {
      #url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager"; # if using unstable nixpkgs branch
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    # integration of home manager for flake-parts
    # TODO what happens if this is not imported
    inputs.home-manager.flakeModules.home-manager
  ];
}
