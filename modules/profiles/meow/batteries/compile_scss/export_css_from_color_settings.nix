{
  den.aspects.users.meow = { profile }:
    let
      colorSettings = profile.settings.theme.colors;
      outputDir = "generated";

      generateFile = filename: lines: { lib, pkgs }:
        pkgs.writeTextDir "${outputDir}/${filename}" ''
          :root {
            ${lib.concatStringsSep "\n  " (lines lib)}
          }
        '';

      colorsFile = { lib, pkgs }:
        generateFile "colors.scss" colorsFileLines { inherit lib pkgs; };
      colorsFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "----${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.default.hex}};"
        )
      ) colorSettings.vars;

      autoThemeFile = { lib, pkgs }:
        generateFile "noctalia_auto_theme.scss" autoThemeFileLines { inherit lib pkgs; };
      autoThemeFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.default.hex}};"
        )
      ) colorSettings.themed;

      lightThemeFile = { lib, pkgs }:
        generateFile "light_theme.scss" lightThemeFileLines { inherit lib pkgs; };
      lightThemeFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.light.hex}};"
        )
      ) colorSettings.themed;

      darkThemeFile = { lib, pkgs }:
        generateFile "dark_theme.scss" darkThemeFileLines { inherit lib pkgs; };
      darkThemeFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.dark.hex}};"
        )
      ) colorSettings.themed;

      rootSrcDir = { lib, pkgs }: pkgs.symlinkJoin {
        name = "generated_scss";
        paths = [
          (colorsFile { inherit lib pkgs; })
          (autoThemeFile { inherit lib pkgs; })
          (lightThemeFile { inherit lib pkgs; })
          (darkThemeFile { inherit lib pkgs; })
        ];
      };
      outputDirFullPath = { lib, pkgs }:
        "${rootSrcDir { inherit lib pkgs; }}/${outputDir}";

      # substitutions to make css vars more clear if needed; keep updated!
      cssVarNameSubstsFrom = [
        "-border-1:"
        "-border-2:"
        "-border-3:"
        "-border-4:"
        "-border-5:"
        "-border-default:"
        "-error:"
        "-warning:"
        "-success:"
        "-link:"
        "-link-hover:"
        "-link-disabled:"
        "-link-visited:"
        "-code-class:"
        "-code-comment:"
        "-code-constant:"
        "-code-function:"
        "-code-keyword:"
        "-code-variable:"
        "-md-bold:"
        "-md-itialic:"
        "-md-title:"
        "-md-code:"
        "-border:"
        "-border-vrnt-1:"
        "-border-vrnt-2:"
        "-border-slct:"
      ];
      cssVarNameSubstsTo = [
        "-border-1-color:"
        "-border-2-color:"
        "-border-3-color:"
        "-border-4-color:"
        "-border-5-color:"
        "-border-default-color:"
        "-error-color:"
        "-warning-color:"
        "-success-color:"
        "-link-fg:"
        "-link-hover-fg:"
        "-link-disabled-fg:"
        "-link-visited-fg:"
        "-code-class-fg:"
        "-code-comment-fg:"
        "-code-constant-fg:"
        "-code-function-fg:"
        "-code-keyword-fg:"
        "-code-variable-fg:"
        "-md-bold-fg:"
        "-md-itialic-fg:"
        "-md-title-fg:"
        "-md-code-fg:"
        "-border-color:"
        "-border-vrnt-1-color:"
        "-border-vrnt-2-color:"
        "-border-slct-color:"
      ];
    in
    {
      quirks-compile-scss-paths-to-compile = { lib, pkgs, ...}: [
        (outputDirFullPath { inherit lib pkgs; })
      ];

      quirks-compile-scss-paths-to-load = { lib, pkgs, ... }: [
        (outputDirFullPath { inherit lib pkgs; })
      ];
    };
}
