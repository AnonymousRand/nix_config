{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
      base16Scheme = ../dotfiles/stylix/anonymousrand_dark.yaml;
    };
  };
}
