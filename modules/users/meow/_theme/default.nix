{ self, lib, pkgs, ... }: {
  colors                 = import ./colors.nix;
  #css-config             = self.packages.${pkgs.stdenv.hostPlatform.system}.compile-scss-config;
  noctalia-custom-colors = import ./noctalia_custom_colors.nix { inherit lib; };
  #css-config = assert builtins.hasAttr "compile-scss-config" self.packages.${pkgs.stdenv.hostPlatform.system}; self.packages.${pkgs.stdenv.hostPlatform.system}.compile-scss-config;
}
