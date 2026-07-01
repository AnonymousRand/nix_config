{
  flake.homeModules.meow = {
    programs.niri = {
      enable = true;
      settings = {
        spawn-at-startup = [
          # start Noctalia as well on Niri startup
          { command = [ "noctalia-shell" ]; }
        ];
      };
    }
  };
}
