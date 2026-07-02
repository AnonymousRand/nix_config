{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        theme = {
          source = "builtin";
          builtin = "Catppuccin";
        };
      };
    };
  };
}
