{ inputs, lib, pkgs, ... }: rec {
  colors               = import ./colors.nix;
  noctaliaCustomColors = import ./noctalia_custom_colors.nix { inherit lib; };

  cssConfig = pkgs.callPackage ./scss/compile_scss_config.nix {
    noctalia             = inputs.noctalia.packages.default;
    m3Palette            = colors.m3Palette;
    noctaliaCustomColors = noctaliaCustomColors;
  };
}
