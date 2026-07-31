{
  den.aspects.features.tools.brightnessctl = { host, lib, ... }:
    lib.mkIf host.capabilities.brightness.supported {
      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
    };
}
