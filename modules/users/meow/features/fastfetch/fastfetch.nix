{
  flake.modules.homeManager.meow.fastfetch = {
    programs.fastfetch = {
      enable = true;
    };

    xdg.configFile."fastfetch/config.jsonc".source = ./dotfiles/config.jsonc;
  };
}
