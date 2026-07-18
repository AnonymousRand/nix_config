{
  flake.nixosModules.tree = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.tree
    ];
  };
}
