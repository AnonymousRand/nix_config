{
  flake.nixosModules.wget = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wget
    ];
  };
}
