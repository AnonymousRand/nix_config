{ inputs, ... }: {
  flake-file.inputs = {
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.tools.solaar = {
    # put here so that this is imported regardless of if `syst` is in context (otherwise, other
    # aspects wishing to set options defined in these imports must all require `syst` arg as well)
    includes = [
      {
        nixos.imports = [ inputs.solaar.nixosModules.default ];
      }
    ];

    nixos = {
      services.solaar.enable = true;
    };
  };
}
