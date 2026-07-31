{
  den.aspects.features.apps.firefox = {
    homeManager = { host, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      programs.firefox.enable = true;
    };
  };
}
