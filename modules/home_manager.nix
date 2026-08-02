{ inputs, ... }: {
  flake-file.inputs = {
    home-manager = {
      #url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager"; # if using unstable nixpkgs branch
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    # allows standalone Home Manager configs
    inputs.home-manager.flakeModules.home-manager
  ];
}
