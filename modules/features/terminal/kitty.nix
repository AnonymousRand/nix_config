{
  den.aspects.features.terminal.kitty = { host ? null, home ? null }: {
    homeManager =
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        programs.kitty.enable = true;
      };
  };
}
