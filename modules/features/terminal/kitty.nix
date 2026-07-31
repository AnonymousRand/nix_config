{
  den.aspects.features.terminal.kitty = {
    homeManager = { host, ... }: import ../_requires_capabilities.nix host [ "graphics" ] {
      programs.kitty.enable = true;
    };
  };
}
