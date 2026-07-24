{
  flake-file.inputs = {
    # Niri has a built-in flake as a NixOS option but it doesn't have Home Manager options
    niri = {
      # sodiboo's flake is the common alternative but it's being slow with updates
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.niri = {
    nixos = { pkgs, ... }: {
      programs.niri = {
        enable = true;
      };

      environment.systemPackages = [
        # niri's main way of doing xwayland
        pkgs.xwayland-satellite
      ];

      # enable `pkgs.niri-stable` etc. as if they were part of nixpkgs
      nixpkgs.overlays = [
        inputs.niri.overlays.niri
      ];
    };

    homeManager = {
      imports = [
        inputs.niri.homeModules.niri
      ];

      programs.niri = {
        enable = true;
        package = pkgs.niri-stable; # uses overlay
      };
    };
  };
}
