{
  den.aspects.features.terminal.ghostty = { host ? null, home ? null }: {
    homeManager =
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        programs.ghostty.enable = true;
      };
  };
}
