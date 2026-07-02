{
  flake.nixosModules.noctalia-v4 = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      noctalia-shell
      #inputs.noctalia-v4.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
