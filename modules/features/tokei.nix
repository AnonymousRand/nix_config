{
  flake.nixosModules.tokei = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.tokei
    ];
  };
}
