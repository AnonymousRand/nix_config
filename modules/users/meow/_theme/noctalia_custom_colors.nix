# this file has to be a module independent of home manager so that the `compile-scss-config`
# derivation can import it before anything with home manager is built

#let
#  colors = import ./colors.nix;
#in {
#  imports = [
#    colors.vars
#    colors.roles
#  ];
#}

{ config, lib, ... }:

let
  colors = import ./colors.nix;
in {
  options.meow.noctalia-custom-colors = lib.mkOption { type = lib.types.attrs; };

  config.meow.noctalia-custom-colors = colors.vars // colors.roles;
}
