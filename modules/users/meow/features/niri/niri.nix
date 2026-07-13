{ inputs, ... }: {
  flake.homeModules.meow = { config, pkgs, ... }:

  let
    systemConfig = config;
  in {
    imports = [
      inputs.niri.homeModules.niri
    ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-stable; # enables newer versions of niri
      config = builtins.readFile ./dotfiles/niri/config.kdl +
          # put at end as `include`s override prior options
          # optional include to pass `niri validate` when home manager is building and `noctalia.kdl` doesn't exist yet
          "\ninclude optional=true \"${systemConfig.xdg.configHome}/niri/noctalia_theme.kdl\"";
    };

    # Noctalia theming
    programs.noctalia = {
      settings = rec {
        theme.templates.custom_colors = config.custom_colors;

        config.custom_colors = {
          # for active window border/focus ring gradient
          active_gradient_start = {
            color_light = "#ff369a";
            color_dark  = "#ff369a";
          };
          active_gradient_end = {
            color_light = "#00e1ff";
            color_dark  = "#00e1ff";
          };
        };

        theme.templates.user.niri = {
          input_path = builtins.toString ./dotfiles/niri/noctalia_theme.kdl;
          output_path = "$XDG_CONFIG_HOME/niri/noctalia_theme.kdl";
        };
      };
    };
  };
}
