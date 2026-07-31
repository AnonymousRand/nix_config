{
  den.aspects.features.tools.brightnessctl = { config, lib, ... }: {
    meta.requiredCapabilities = [ "brightness" ];

    #homeManager = { pkgs, ... }: {
    #  home.packages = [
    #    pkgs.brightnessctl
    #  ];
    #};

    homeManager = { host, pkgs, ... }:
      let
        #areRequiredCapabilitiesMet = false;
        areRequiredCapabilitiesMet =
          builtins.foldl' (acc: new: acc && host.capabilities.${new}.supported)
          true config.meta.requiredCapabilities;
      in
      lib.mkIf areRequiredCapabilitiesMet {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
