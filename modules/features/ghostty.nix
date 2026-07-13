{ inputs, ... }: {
  flake.nixosModules.ghostty = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
