{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-stable; # enables newer versions of niri
    config = builtins.readFile ./dotfiles/config.kdl +
        # put at end as `include`s override prior options
        # optional include to pass `niri validate` when home manager is building and `noctalia.kdl` doesn't exist yet
        "\ninclude optional=true \"${config.xdg.configHome}/niri/noctalia_theme.kdl\"";
  };

  # Noctalia theming
  meow.theme.noctaliaCustomColors = import ./colors.nix;
  programs.noctalia = {
    settings = {
      theme.templates.user.niri = {
        input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
        output_path = "$XDG_CONFIG_HOME/niri/noctalia_theme.kdl";
      };
    };
  };
}
