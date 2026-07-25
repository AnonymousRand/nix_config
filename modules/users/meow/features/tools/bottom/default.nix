{ den, ... }: {
  meow.features.tools.bottom = {
    includes = [
      den.aspects.features.tools.bottom
    ];

    # noctalia theming
    noctalia-custom-colors = import ./colors.nix;
    noctalia-templates.niri = {
      input_path = builtins.toString ./dotfiles/bottom.toml;
      output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
    };
  };
}
