{ inputs, ... }: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia = { host ? null, home ? null }: {
    nixos = { host, lib, pkgs, ... }:
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

    homeManager =
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        imports = [
          inputs.noctalia.homeModules.default
        ];

        programs.noctalia.enable = true;
      };
  };
}
