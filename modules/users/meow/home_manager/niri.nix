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
          { command = [ "noctalia-shell" ]; }
        ];

        binds = with config.lib.niri.actions; {
          "Mod+T".action = { spawn = [ "kitty" ]; };
        };
      };
    };
  };
}
