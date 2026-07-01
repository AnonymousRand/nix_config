{ inputs, ... }: {
#{
  flake.nixosModules.noctalia = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      #noctalia-shell
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
