{
  flake.homeModules.meow = {
    programs.hyfetch = {
      enable = true;
    };

    xdg.configFile."hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
