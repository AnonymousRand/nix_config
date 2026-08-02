{ den, ... }: {
  den.aspects.features.tools.brightnessctl = { host ? null, home ? null }: {
    homeManager = { pkgs, ... }:
      import ../_require_capabilities.nix { inherit host home; } [ "brightness" ] {
        home.packages = [
          pkgs.brightnessctl
        ];
      };
  };
}
