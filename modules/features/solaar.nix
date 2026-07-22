{ inputs, ... }: {
  flake.modules.nixos.solaar = {
    imports = [
      inputs.solaar.nixosModules.default
    ];

    services.solaar.enable = true;
  };
}
