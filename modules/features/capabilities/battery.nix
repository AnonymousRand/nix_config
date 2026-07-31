{
  den.aspects.features.capabilities.battery = {
    meta.requiredCapabilities = [ "battery" ];

    nixos = {
      # enable battery status feature
      services.upower.enable = true; 
    };
  };
}
