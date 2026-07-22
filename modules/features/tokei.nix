{
  flake.modules.nixos.tokei = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.tokei
    ];
  };
}
