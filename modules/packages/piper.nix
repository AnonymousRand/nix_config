{
  flake.nixosModules.piper = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      piper
    ];
  };
}
