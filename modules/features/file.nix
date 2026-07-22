{
  flake.modules.nixos.file = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.file
    ];
  };
}
