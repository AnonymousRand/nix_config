{ inputs, ... }: {
  den.aspects.features.tools.solaar = {
    nixos = {
      programs.solaar.enable = true;
    };
  };
}
