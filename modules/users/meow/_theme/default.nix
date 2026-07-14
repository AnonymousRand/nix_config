{ inputs, lib, pkgs, ... }: rec {
  colors           = import ./colors.nix;
  noctaliaSettings = import ./noctalia_settings.nix { inherit lib; };

  cssConfig = pkgs.callPackage ./scss/compile_scss_config.nix {
    noctalia         = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
    m3Palette        = colors.m3Palette;
    noctaliaSettings = noctaliaSettings;
  };
}
