{
  den.aspects.features.desktop.noctalia.plugins.bongocat = {
    nixos = { syst, lib, pkgs, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" "inputs" ]) {
        environment.systemPackages = [
          pkgs.evtest
        ];
      };

    homeManager = { syst, ... }: {
      programs.noctalia.settings = {
        plugins.enabled = [
          "noctalia/bongocat"
        ];

        # needed for bongocat to detect keyboards
        widget."noctalia/bongocat:cat" = {
          input_devices = syst.settings.capabilities.inputs.keyboard_devices;
        };
      };
    };
  };
}
