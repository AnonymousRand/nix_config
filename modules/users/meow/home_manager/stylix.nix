{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
    };
  };
}
