{
  flake.nixosModules.wl-color-picker = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wl-color-picker
    ];
  };
}
