{
  den.aspects.desktop.niri.meow = {
    homeManager = { config, pkgs, ... }: {
      programs.niri = {
        config = builtins.readFile ./dotfiles/config.kdl +
            # put at end as `include`s override prior options
            # optional include to pass `niri validate` when home manager is building,
            # as then `noctalia.kdl` doesn't exist yet
            "\ninclude optional=true \"${config.xdg.configHome}/niri/noctalia_theme.kdl\"";
      };

      # Noctalia theming
      noctalia-custom-colors = import ./colors.nix;
      programs.noctalia = {
        settings.theme.templates.user.niri = {
          input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
          output_path = "$XDG_CONFIG_HOME/niri/noctalia_theme.kdl";
        };
      };
    };
  };
}
