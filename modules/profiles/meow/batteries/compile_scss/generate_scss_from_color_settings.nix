{
  den.aspects.users.meow = { profile }:
    let
      colorSettings = profile.settings.theme.colors;

      outputDir = "generated";

      baseVarsFile = { lib, pkgs }: pkgs.writeTextDir "${outputDir}/base_vars.scss" ''
        :root {
          ${lib.concatStringsSep "\n  " (baseVarsFileLines lib)}
        }
      '';
      baseVarsFileLines = lib: lib.mapAttrsToList (name: value:
        "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
        + "{{colors.${name}_source.default.hex}};"
      ) colorSettings.vars;
      baseVarsFileParentDir = { lib, pkgs }:
        "${baseVarsFile { inherit lib pkgs; }}/${outputDir}";
      baseVarsFileGrandparentDirName = { lib, pkgs }:
        # this may break if the path has a trailing slash!
        builtins.baseNameOf "${baseVarsFile { inherit lib pkgs; }}";
    in
    {
      quirks-compile-scss-paths-to-compile = { lib, pkgs, ...}: [
        (baseVarsFile { inherit lib pkgs; })
      ];

      quirks-compile-scss-paths-to-load = { lib, pkgs, ... }: [
        (baseVarsFileParentDir { inherit lib pkgs; })
      ];

      homeManager = { config, lib, pkgs, ... }: {
        aspects.batteries.noctalia-theming.templates = {
          externBaseVars = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/"
              + "${baseVarsFileGrandparentDirName { inherit lib pkgs; }}/"
              + "${outputDir}/base_vars.css";
            output_path = "$XDG_DATA_HOME/external_css/base_vars.css";
          };
        };
      };
    };
}
