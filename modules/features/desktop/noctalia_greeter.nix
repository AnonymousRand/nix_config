{ inputs, ... }: {
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia-greeter = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
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
