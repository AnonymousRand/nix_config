{ inputs, ... }: {
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia-greeter = { host ? null, home ? null }: {
    nixos =
      import ../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
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
