{ den, ... }: {
  meow.features.tools.bottom = {
    includes = [
      den.aspects.features.tools.bottom
    ];

    # noctalia theming
    den.aspects.utils.noctalia-theming.customColors = import ./_colors.nix;
    den.aspects.utils.noctalia-theming.templates.bottom = {
      input_path = builtins.toString ./dotfiles/bottom.toml;
      output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
    };
  };
}
