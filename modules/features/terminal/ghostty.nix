{
  den.aspects.features.terminal.ghostty = {
    meta.requiredCapabilities = [ "graphics" ];

    homeManager = {
      programs.ghostty.enable = true;
    };
  };
}
