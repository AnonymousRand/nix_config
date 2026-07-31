{
  den.aspects.features.capabilities.battery = {
    nixos = { host, ... }: import ../_requires_capabilities.nix host [ "battery" ] {
      # enable battery status feature
      services.upower.enable = true; 
    };
  };
}
