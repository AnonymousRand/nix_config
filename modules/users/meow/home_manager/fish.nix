{
  flake.homeModules.meow = { config, ... }:

  let
    systemConfig = config;
  in {
    programs.fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ../dotfiles/fish/interactive_shell_init.fish +
          "\nsource ${systemConfig.xdg.configHome}/fish/noctalia_theme.fish";
    };

    # yes, i know this isn't how you're supposed to initialize functions,
    # but the native `programs.fish.functions` syntax pisses me off >_<
    # (the alternative is a monolithic mess inside `interactiveShellInit.fish`)
    xdg.configFile."fish/functions/fish_mode_prompt.fish".source =
        ../dotfiles/fish/functions/fish_mode_prompt.fish;
    xdg.configFile."fish/functions/fish_prompt.fish".source =
        ../dotfiles/fish/functions/fish_prompt.fish;
    xdg.configFile."fish/functions/fish_right_prompt.fish".source =
        ../dotfiles/fish/functions/fish_right_prompt.fish;
    xdg.configFile."fish/functions/fish_title.fish".source =
        ../dotfiles/fish/functions/fish_title.fish;
    xdg.configFile."fish/functions/fish_user_key_bindings.fish".source =
        ../dotfiles/fish/functions/fish_user_key_bindings.fish;

    # Noctalia theming
    programs.noctalia = {
      settings = rec {
        theme.templates.custom_colors = config.custom_colors;

        config.custom_colors = {
          # for shell "scales" prompt; hardcode to not be affected by `color-vars` changes
          scales_blue = {
            color_light = "#26edff";
            color_dark  = "#40efff";
          };
          scales_green = {
            color_light = "#7ee600";
            color_dark  = "#a8ff3d";
          };
          scales_orange = {
            color_light = "#ffc400";
            color_dark  = "#ffd500";
          };
          scales_pink = {
            color_light = "#ffa8d4";
            color_dark  = "#ffa8d4";
          };
        };

        theme.templates.user.fish = {
          input_path = builtins.toString ../dotfiles/fish/noctalia_theme.fish;
          output_path = "$XDG_CONFIG_HOME/fish/noctalia_theme.fish";
        };
      };
    };
  };
}
