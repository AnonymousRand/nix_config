{ den, ... }: {
  meow.features.terminal.fish = {
    includes = [
      den.aspects.features.terminal.fish
    ];

    homeManager = { config, ... }:
      let
        noctaliaThemeCfgPath = "fish/noctalia_theme.fish";
      in
      {
        programs.fish = {
          interactiveShellInit = builtins.readFile ./dotfiles/interactive_shell_init.fish +
              "\nsource ${config.xdg.configHome}/${noctaliaThemeCfgPath}";
        };

        # yes, i know this isn't how you're supposed to initialize functions,
        # but the native `programs.fish.functions` syntax pisses me off >_<
        # (and the alternative is a monolithic mess inside `interactiveShellInit.fish`)
        xdg.configFile."fish/functions/" = {
          source = ./dotfiles/functions;
          recursive = true;
        };

        # noctalia theming
        theme.noctalia-theming.templates.fish = {
          input_path = builtins.toString ./dotfiles/noctalia_theme.fish;
          output_path = "$XDG_CONFIG_HOME/${noctaliaThemeCfgPath}";
        };
      };
  };
}
