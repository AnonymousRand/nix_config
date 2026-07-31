{
  den.aspects.features.capabilities.networking = {
    nixos = { host, ... }: import ../_require_capabilities.nix host [ "networking" ] {
      # enable network manager
      networking.networkmanager.enable = true;

      # maybe help with wifi issues after suspend
      networking.networkmanager.wifi.powersave = false;
    };
  };
}
