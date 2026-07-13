# this file has to be a module independent of home manager so that the `compile-scss-config`
# derivation can import it before anything with home manager is built

{ lib }:

let
  colors = import ./colors.nix;
  # `hasSuffix` instead of exact filename match since they turn into nix store paths
  colorFiles = builtins.filter
               (filename: lib.strings.hasSuffix "_colors.nix" filename)
               (lib.filesystem.listFilesRecursive ../features);
in
  colors.vars // colors.roles // lib.attrsets.mergeAttrsList (map import colorFiles)
