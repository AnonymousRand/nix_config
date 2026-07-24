{ inputs, ... }: {
  flake-file.inputs = {
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.solaar = {
    nixos = {
      imports = [
        inputs.solaar.nixosModules.default
      ];

      services.solaar.enable = true;
    };
  };
}
