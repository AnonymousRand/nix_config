{
  den.aspects.features.terminal.kitty = {
    homeManager = { host, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      programs.kitty.enable = true;
    };
  };
}
