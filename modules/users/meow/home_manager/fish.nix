{
  flake.homeModules.meow = { config, ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ../dotfiles/fish/interactiveShellInit.fish;
    };

    # Noctalia theming
    programs.noctalia = {
      settings = {
        theme.templates.user.fish = {
          input_path = builtins.toString ../dotfiles/noctalia/templates/fish.fish;
          output_path = "$XDG_CONFIG_HOME/fish/noctalia_theme.fish";
        };
      };
    };
  };
}
