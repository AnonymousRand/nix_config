{ den, ... }: {
  meow.features.tools.hyfetch = {
    includes = [
      den.aspects.features.tools.hyfetch
    ];

    homeManager = {
      xdg.configFile."hyfetch.json".source = ./dotfiles/hyfetch.json;
    };
  };
}
