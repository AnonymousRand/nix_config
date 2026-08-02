{
  den.aspects.features.apps.firefox = { host ? null, home ? null }: {
    homeManager =
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        programs.firefox.enable = true;
      };
  };
}
