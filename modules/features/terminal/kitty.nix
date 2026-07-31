{
  den.aspects.features.terminal.kitty = {
    meta.requiredCapabilities = [ "graphics" ];

    homeManager = {
      programs.kitty.enable = true;
    };
  };
}
