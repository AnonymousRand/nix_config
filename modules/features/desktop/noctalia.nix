{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
      nixos = { pkgs, ... }: {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

      homeManager = {
        imports = [
          inputs.noctalia.homeModules.default
        ];

        programs.noctalia.enable = true;
      };
    };
}
