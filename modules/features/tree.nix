{
  flake.nixosModules.tree = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      tree
    ];
  };
}
