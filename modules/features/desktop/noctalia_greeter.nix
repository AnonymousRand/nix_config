{ inputs, ... }: {
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia-greeter = {
    # put here so that this is imported regardless of if `core` is in context (otherwise, other
    # aspects wishing to set options defined in these imports must all require `core` arg as well)
    includes = [
      { nixos.imports = [ inputs.noctalia-greeter.nixosModules.default ]; }
    ];

    nixos = { core, lib, ... }:
      lib.mkIf (core.capabilities.has [ "graphics" ]) {
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
