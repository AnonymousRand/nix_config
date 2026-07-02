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

    #noctalia-v4 = {
    #  url = "github:noctalia-dev/noctalia/legacy-v4";
    #  inputs.nixpkgs.follows = "nixpkgs-unstable"; # Noctalia v4 requires nixpkgs unstable
    #};
    noctalia = {
      url = "github:noctalia-dev/noctalia";
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

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
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
