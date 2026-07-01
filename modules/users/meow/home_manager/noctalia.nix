{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      #settings = {
      #  colorSchemes.predefinedScheme = "Catppuccin";
      #};
      settings = ../dotfiles/noctalia/settings.json
    };
  };
}
