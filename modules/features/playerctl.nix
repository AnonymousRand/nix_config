{
  flake.nixosModules.playerctl = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.playerctl
    ];
  };
}
