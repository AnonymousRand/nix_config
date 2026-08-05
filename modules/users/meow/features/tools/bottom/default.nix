{ den, ... }: {
  meow.features.tools.bottom = { userSettings }: {
    includes = [
      den.aspects.features.tools.bottom
    ];

    homeManager = {
      # noctalia theming
      utils.noctalia-theming = {
        customColors = import ./_colors.nix;
        templates.bottom = {
          input_path = builtins.toString ./dotfiles/bottom.toml;
          output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
        };
      };
    };
  };
}
