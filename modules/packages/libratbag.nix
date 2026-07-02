{
  flake.nixosModules.libratbag = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libratbag
    ];
  };
}
