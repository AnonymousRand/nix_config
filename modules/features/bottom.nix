{
  flake.modules.nixos.bottom = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.bottom
    ];
  };
}
