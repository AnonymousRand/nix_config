{
  den.aspects.features.capabilities.bluetooth = {
    nixos = { host, ... }: import ../_requires_capabilities.nix host [ "bluetooth" ] {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
