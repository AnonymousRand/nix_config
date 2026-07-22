{
  flake.modules.nixos.tree = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.tree
    ];
  };
}
