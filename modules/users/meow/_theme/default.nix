{ self, lib, pkgs, ... }: {
  colors                 = import ./colors.nix;
  #css-config             = self.packages.${pkgs.stdenv.hostPlatform.system}.compile-scss-config;
  noctalia-custom-colors = import ./noctalia_custom_colors.nix { inherit lib; };
}
