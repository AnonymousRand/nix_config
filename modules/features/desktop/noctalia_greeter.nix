{ inputs, ... }: {
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia-greeter = {
    nixos = {
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
  };
}
