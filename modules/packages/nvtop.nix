{
  flake.nixosModules.nvtop = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nvtopPackages.full
    ];
  };
}
