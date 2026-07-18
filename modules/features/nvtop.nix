{
  flake.nixosModules.nvtop = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.nvtopPackages.full
    ];
  };
}
