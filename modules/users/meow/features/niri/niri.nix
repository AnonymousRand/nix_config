{ inputs, ... }: {
  flake.modules.homeManager.meow.niri = { config, pkgs, ... }: {
    imports = [
      inputs.niri.modules.homeManager.niri
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
    programs.noctalia = {
      settings = {
        theme.templates.custom_colors = config.meow.theme.colors.niri;
        theme.templates.user.niri = {
          input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
          output_path = "$XDG_CONFIG_HOME/niri/noctalia_theme.kdl";
        };
      };
    };
  };
}
