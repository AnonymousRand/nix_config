{ config, ... }: {
  programs.bottom = {
    enable = true;
  };

  # Noctalia theming
  meow.theme.noctaliaCustomColors = import ./colors.nix;
  programs.noctalia = {
    settings = {
      theme.templates.user.bottom = {
        input_path = builtins.toString ./dotfiles/bottom.toml;
        output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
      };
    };
  };
}
