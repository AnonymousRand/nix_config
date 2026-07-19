{ inputs, ... }: {
  flake.homeModules.meow = { pkgs, ... }: {
    programs.hyfetch = {
      enable = true;
    };

    xdg.configFile."hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
