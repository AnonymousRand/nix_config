{ inputs, ... }: {
  flake.homeModules.meow = { config, ... }: {
    imports = [
      inputs.niri.homeModules.niri
    ];

    programs.niri = {
      enable = true;
      settings = {
        spawn-at-startup = [
          # start Noctalia as well on Niri startup
          { argv = [ "noctalia-shell" ]; }
        ];

        binds = with config.lib.niri.actions; {
          "Shift+T".action = spawn "kitty";
        };
      };
    };
  };
}
