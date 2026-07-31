{
  den.aspects.features.terminal.ghostty = {
    homeManager = { host, ... }: import ../_requires_capabilities.nix host [ "graphics" ] {
      programs.ghostty.enable = true;
    };
  };
}
