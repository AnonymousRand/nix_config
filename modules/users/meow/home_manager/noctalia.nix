{ inputs, ... }: {
  flake.homeModules.meow = { lib, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      #settings.colorSchemes.predefinedScheme = "Catppuccin";
      settings = lib.mkForce {
        colorSchemes.predefinedScheme = "Catppuccin";
      };
    };
  };
}
