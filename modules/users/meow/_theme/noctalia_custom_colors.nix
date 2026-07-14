# this file has to be a module independent of home manager so that the `compile-scss-config`
# derivation can import it before anything with home manager is built

{ lib }:

let
  colors = import ./colors.nix;
  # `hasSuffix` instead of exact filename match since they turn into nix store paths
  colorFiles = builtins.filter
               (filename: lib.strings.hasSuffix "_colors.nix" filename)
               (lib.filesystem.listFilesRecursive ../features);
  finalColors = colors.vars // colors.roles // lib.attrsets.mergeAttrsList (map import colorFiles);
in {
  theme.templates.custom_colors = finalColors;
  # we also put custom colors in `config` as this is what the Noctalia template engine must use
  # when running by itself (e.g. via `noctalia theme` CLI). on the other hand, when Noctalia
  # starts up normally/reloads its config, `theme.templates.custom_colors` is fine since
  # it sort of copies it to its internal `config.custom_colors`
  config.custom_colors = finalColors;
}
