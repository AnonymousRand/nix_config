{ den, ... }: {
  meow.features.desktop.niri =
    let
      noctaliaThemeCfgPath = "niri/noctalia_theme.kdl";
    in
    {
      includes = [
        den.aspects.features.desktop.niri
      ];

      homeManager = { config, ... }: {
        wayland.windowManager.niri = {
          extraConfig = ''
            ${builtins.readFile ./dotfiles/config.kdl}

            // put at end as `include`s override prior options
            // optional include to pass `niri validate` when home manager is building,
            // as then `noctalia.kdl` doesn't exist yet
            include optional=true "${config.xdg.configHome}/${noctaliaThemeCfgPath}"
          '';
        };
      };

      # noctalia theming
      den.aspects.utils.noctalia-theming.customColors = import ./_colors.nix;
      den.aspects.utils.noctalia-theming.templates.niri = {
        input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
        output_path = "$XDG_CONFIG_HOME/${noctaliaThemeCfgPath}";
      };
    };
}
