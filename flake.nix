{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri has a built-in flake as a NixOS option but it doesn't have Home Manager options
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      #url = "github:noctalia-dev/noctalia";
      url = "github:AnonymousRand/noctalia"; # my own fork with custom color light and dark modes
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    imports = [
      (inputs.import-tree ./modules)
      inputs.home-manager.flakeModules.home-manager # to allow standalone Home Manager configs
    ];
  };
}
