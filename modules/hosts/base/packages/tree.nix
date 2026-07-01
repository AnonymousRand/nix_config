{
  flake.nixosModules.base = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      tree
    ];
  };
}
