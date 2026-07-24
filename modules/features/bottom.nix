{
  flake.modules.nixos.system-monitors = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.bottom
    ];
  };
}
