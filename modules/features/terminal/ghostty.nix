{
  den.aspects.features.terminal.ghostty = {
    homeManager = { host, ... }: import ../_require_capabilities.nix host [ "graphics" ] {
      programs.ghostty.enable = true;
    };
  };
}
