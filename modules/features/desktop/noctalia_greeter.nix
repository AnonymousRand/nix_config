{ inputs, ... }: {
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.features.desktop.noctalia-greeter = {
    # put here so that this is imported regardless of if `systSettings` is in context
    # (otherwise, other aspects wishing to set options defined in these imports must all
    # require `systSettings` arg as well)
    includes = [
      { nixos.imports = [ inputs.noctalia-greeter.nixosModules.default ]; }
    ];

    nixos = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
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
