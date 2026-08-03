{ den, ... }: {
  meow.features.desktop.niri = {
    includes = [
      den.aspects.features.desktop.niri
    ];

    homeManager = { config, ... }:
      let
        noctaliaThemeCfgPath = "niri/noctalia_theme.kdl";
      in
      {
        wayland.windowManager.niri = {
          extraConfig = ''
            ${builtins.readFile ./dotfiles/config.kdl}

            // put at end as `include`s override prior options
            // optional include to pass `niri validate` when home manager is building,
            // as then `noctalia.kdl` doesn't exist yet
            include optional=true "${config.xdg.configHome}/${noctaliaThemeCfgPath}"
          '';
        };

        # noctalia theming
        utils.noctalia-theming = {
          customColors = import ./_colors.nix;
          templates.niri = {
            input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
            output_path = "$XDG_CONFIG_HOME/${noctaliaThemeCfgPath}";
          };
        };
      };
  };
}
