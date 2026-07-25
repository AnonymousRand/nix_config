{ den, ... }: {
  meow.features.tools.fastfetch = {
    includes = [
      den.aspects.features.tools.fastfetch
    ];

    homeManager = {
      xdg.configFile."fastfetch/config.jsonc".source = ./dotfiles/config.jsonc;
    };
  };
}
