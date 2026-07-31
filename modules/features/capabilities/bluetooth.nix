{
  den.aspects.features.capabilities.bluetooth = {
    nixos = { host, ... }: import ../_require_capabilities.nix host [ "bluetooth" ] {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
