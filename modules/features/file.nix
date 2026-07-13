{
  flake.nixosModules.file = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      file
    ];
  };
}
