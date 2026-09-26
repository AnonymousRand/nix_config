{
  den.aspects.users.meow = {
    homeManager = { config, ... }:
      let
        noctaliaThemeCfgPath = "niri/noctalia_theme.kdl";
        cfgFiles = builtins.filter
          (filename: filename != "noctalia_theme.kdl")
          (builtins.attrNames (builtins.readDir ./dotfiles));
      in
      {
        wayland.windowManager.niri = {
          extraConfig =
            # (optional include to pass `niri validate` when home manager is building,
            # as then the `xdg.configFile` and noctalia templates might not exist yet)
            builtins.foldl' (acc: new:
              acc + "\ninclude optional=true \"${config.xdg.configHome}/niri/${new}\""
            ) "" cfgFiles
            + "\ninclude optional=true \"${config.xdg.configHome}/${noctaliaThemeCfgPath}\"";
        };

        # we need to do this insitead of a recursive `xdg.configFile` to specifically exclude
        # the unrendered noctalia theme template file :(
        xdg.configFile = builtins.listToAttrs (builtins.map (
          filename: {
            name = "niri/${filename}";
            value = { source = ./dotfiles/${filename}; };
          }
        ) cfgFiles);

        # noctalia theming
        batteries.theme.noctalia-theming = {
          customColors = import ./_colors.nix;
          templates.niri = {
            input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
            output_path = "$XDG_CONFIG_HOME/${noctaliaThemeCfgPath}";
          };
        };
      };
  };
}
