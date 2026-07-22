{ inputs, ... }: {
  flake.modules.nixos.niri = {
    programs.niri = {
      enable = true;
    };

    # enable `pkgs.niri-stable` etc. as if they were part of nixpkgs
    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];
  };
}
