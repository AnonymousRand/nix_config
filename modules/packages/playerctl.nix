{
  flake.nixosModules.playerctl = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      playerctl
    ];
  };
}
