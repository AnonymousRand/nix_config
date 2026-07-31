{
  den.aspects.features.capabilities.networking = {
    meta.requiredCapabilities = [ "networking" ];

    nixos = {
      # enable network manager
      networking.networkmanager.enable = true;

      # maybe help with wifi issues after suspend
      networking.networkmanager.wifi.powersave = false;
    };
  };
}
