{ config, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./dotfiles/interactive_shell_init.fish +
        "\nsource ${config.xdg.configHome}/fish/noctalia_theme.fish";
  };

  # yes, i know this isn't how you're supposed to initialize functions,
  # but the native `programs.fish.functions` syntax pisses me off >_<
  # (the alternative is a monolithic mess inside `interactiveShellInit.fish`)
  xdg.configFile."fish/functions/fish_mode_prompt.fish".source =
      ./dotfiles/functions/fish_mode_prompt.fish;
  xdg.configFile."fish/functions/fish_prompt.fish".source =
      ./dotfiles/functions/fish_prompt.fish;
  xdg.configFile."fish/functions/fish_right_prompt.fish".source =
      ./dotfiles/functions/fish_right_prompt.fish;
  xdg.configFile."fish/functions/fish_title.fish".source =
      ./dotfiles/functions/fish_title.fish;
  xdg.configFile."fish/functions/fish_user_key_bindings.fish".source =
      ./dotfiles/functions/fish_user_key_bindings.fish;

  # Noctalia theming
  programs.noctalia = {
    settings = {
      theme.templates.user.fish = {
        input_path = builtins.toString ./dotfiles/noctalia_theme.fish;
        output_path = "$XDG_CONFIG_HOME/fish/noctalia_theme.fish";
      };
    };
  };
}
