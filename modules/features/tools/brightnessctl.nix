{ den, ... }: {
  den.aspects.features.tools.brightnessctl = {
    homeManager = { host, pkgs, ... }: import ../_require_capabilities.nix host [ "brightness" ] {
      home.packages = [
        pkgs.brightnessctl
      ];
    };

    #includes = [
    #  den.aspects.capabilities.require-capabilities
    #];
    #requiredCapabilities = [ "graphics" ];
    #rawHomeManager = { pkgs, ... }: {
    #  home.packages = [
    #    pkgs.brightnessctl
    #  ];
    #};
  };
}
