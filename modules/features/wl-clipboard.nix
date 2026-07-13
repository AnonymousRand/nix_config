{
  flake.nixosModules.wl-clipboard = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
