{
  flake.nixosModules.wl-clipboard = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.wl-clipboard
    ];
  };
}
