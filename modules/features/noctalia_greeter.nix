{ inputs, ... }: {
  flake.modules.nixos.noctaliaGreeter = {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
      enable = true;
      settings = {
        keyboard = {
          layout = "us";
        };
      };
    };
  };
}
