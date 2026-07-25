{ den, ... }: {
  meow.features.tools.fastfetch = {
    includes = [
      den.aspects.features.tools.fastfetch
    ];

    xdg.configFile."fastfetch/config.jsonc".source = ./dotfiles/config.jsonc;
  };
}
