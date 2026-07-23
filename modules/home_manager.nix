{ inputs, ... }: {
  flake-file.inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    # allows standalone Home Manager configs
    inputs.home-manager.flakeModules.home-manager
  ];
}
