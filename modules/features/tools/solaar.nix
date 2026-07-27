{ inputs, ... }: {
  flake-file.inputs = {
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.tools.solaar = {
    nixos = {
      imports = [
        inputs.solaar.nixosModules.default
      ];

      services.solaar.enable = true;
    };
  };
}
