# this file has to be a module independent of home manager so that the `compile-scss-config`
# derivation can import it before anything with home manager is built

{ lib }:

let
  colors = import ./colors.nix;
  # `hasSuffix` instead of exact filename match since they turn into nix store paths
  colorFiles = builtins.filter
               (filename: lib.strings.hasSuffix "_colors.nix" filename)
               (lib.filesystem.listFilesRecursive ../features);
  customColors = colors.vars // colors.roles // lib.attrsets.mergeAttrsList (map import colorFiles);
in {
  theme = {
    # declare my custom color palette for Noctalia app theming
    source = "custom";
    custom_palette = "anonymousrand";

    # switch between light and dark themes automatically
    mode = "light";

    templates = {
      # enable built-in app theming, which uses templates to map
      # Noctalia color palette colors to each app's configs
      enable_builtin_templates = true;
      custom_colors = customColors;
    };
  };

  location = {
    auto_locate = false;
    sunrise = "09:00";
    sunset = "18:00";
  };

  # we also put custom colors in `config` as this is what the Noctalia template engine must use
  # when running by itself (e.g. via `noctalia theme` CLI). on the other hand, when Noctalia
  # starts up normally/reloads its config, `theme.templates.custom_colors` is fine since
  # it sort of copies it to its internal `config.custom_colors`
  config = {
    custom_colors = customColors;
  };
}
