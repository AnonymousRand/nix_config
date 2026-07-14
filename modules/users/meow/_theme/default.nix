{ inputs, lib, pkgs, ... }: {
  colors               = import ./colors.nix;
  noctaliaCustomColors = import ./noctalia_custom_colors.nix { inherit lib; };

  cssConfig = pkgs.callPackage ./scss/compile_scss_config.nix { };
}
