{
  den.aspects.features.capabilities.bluetooth = {
    meta.requiredCapabilities = [ "bluetooth" ];

    nixos = {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
