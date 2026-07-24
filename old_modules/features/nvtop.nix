{
  flake.modules.nixos.nvtop = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.nvtopPackages.full
    ];
  };
}
