# this file has to be a module independent of home manager so that the `compile-scss-config`
# derivation can import it before anything with home manager is built

let
  colors = import ./colors.nix;
in {
  imports = [
    colors.vars
    colors.roles
    colors.extras
  ];
}
