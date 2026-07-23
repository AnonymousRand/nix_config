{ config, ... }: {
  imports = [
    ./colors.nix
  ];

  programs.bottom = {
    enable = true;
  };

  # Noctalia theming
  programs.noctalia = {
    settings = {
      theme.templates.user.bottom = {
        input_path = builtins.toString ./dotfiles/bottom.toml;
        output_path = "$XDG_CONFIG_HOME/bottom/bottom.toml";
      };
    };
  };
}
