{ inputs, ... }: {
  flake.nixosModules.noctalia-greeter = {
    imports = [
      inputs.noctalia-greeter.nixosModules.default # Noctalia Greeter
    ];

    programs.noctalia-greeter = {
      enable = true;
      greeter-args = "--session niri";
      settings = {
        keyboard = {
          layout = "us";
        };
      };
    };
  };
}
