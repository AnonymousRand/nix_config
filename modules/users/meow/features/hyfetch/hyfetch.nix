{ inputs, ... }: {
  flake.modules.homeManager.meow.hyfetch = { pkgs, ... }: {
    programs.hyfetch = {
      enable = true;
    };

    xdg.configFile."hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
