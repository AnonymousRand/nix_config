{
  den.aspects.features.apps.firefox = {
    meta.requiredCapabilities = [ "graphics" ];

    homeManager = {
      programs.firefox.enable = true;
    };
  };
}
