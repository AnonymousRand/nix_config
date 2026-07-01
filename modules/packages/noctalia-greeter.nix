{ inputs, ... }: {
  flake.nixosModules.noctalia-greeter = {
    programs.noctalia-greeter = { pkgs, ... }: {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        keyboard = {
          layout = "us";
        };
      };
    };
  };
}
