{ den, ... }: {
  meow.features.tools.bottom = {
    includes = [
      den.aspects.features.tools.bottom
    ];

    homeManager = {
      # noctalia theming
      theme.noctalia.customColors = import ./_colors.nix;
      programs.noctalia = {
        settings.theme.templates.user.bottom = {
          input_path = builtins.toString ./dotfiles/bottom.toml;
          output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
        };
      };
    };
  };
}
