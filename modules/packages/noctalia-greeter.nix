{ inputs, ... }: {
  flake.nixosModules.noctalia-greeter = {
    imports = [
      inputs.noctalia-greeter.nixosModules.default  # Noctalia Greeter
    ];

    programs.noctalia-greeter = {
      enable = true;
      #package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        keyboard = {
          layout = "us";
        };
      };
    };
  };
}
