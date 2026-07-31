{
  den.aspects.features.apps.firefox = {
    homeManager = { host, ... }: import ../_requires_capabilities.nix host [ "graphics" ] {
      programs.firefox.enable = true;
    };
  };
}
