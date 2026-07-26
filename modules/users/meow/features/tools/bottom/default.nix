{ den, ... }: {
  meow.features.tools.bottom = {
    includes = [
      den.aspects.features.tools.bottom
    ];

    homeManager = {
      # noctalia theming
      noctaliaTheming.customColors = import ./_colors.nix;
      noctaliaTheming.templates.bottom = {
        input_path = builtins.toString ./dotfiles/bottom.toml;
        output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
      };
    };
  };
}
