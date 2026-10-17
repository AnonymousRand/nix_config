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
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
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
      ) colorSettings.roles;

      lightThemeFile = { lib, pkgs }:
        generateFile "light_theme.scss" lightThemeFileLines { inherit lib pkgs; };
      lightThemeFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.light.hex}};"
        )
      ) colorSettings.roles;

      darkThemeFile = { lib, pkgs }:
        generateFile "dark_theme.scss" darkThemeFileLines { inherit lib pkgs; };
      darkThemeFileLines = lib: lib.mapAttrsToList (name: value:
        builtins.replaceStrings cssVarNameSubstsFrom cssVarNameSubstsTo (
          "---${builtins.replaceStrings [ "_" ] [ "-" ] name}: "
          + "{{colors.${name}_source.dark.hex}};"
        )
      ) colorSettings.roles;

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
        "-border-vrnt:"
        "-border-slct:"
      ];
      cssVarNameSubstsTo = [
        "-border-1-color:"
        "-border-2-color:"
        "-border-3-color:"
        "-border-4-color:"
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
        "-border-vrnt-color:"
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

      homeManager = { config, ... }: {
        # copy rendered css output needed for external users from nix store to `$XDG_DATA_HOME`
        # for easier access (currently still needs manual copying to the external places though)
        aspects.batteries.noctalia-theming.templates = {
          externColors = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/${outputDir}/colors.css";
            output_path = "$XDG_DATA_HOME/external_css/colors.css";
          };

          # currently not copying over auto theme since it's not needed
          externLightThemeCss = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/${outputDir}/light_theme.css";
            output_path = "$XDG_DATA_HOME/external_css/light_theme.css";
          };

          externDarkThemeCss = {
            input_path =
              "${config.aspects.batteries.compile-scss.cssOutput}/${outputDir}/dark_theme.css";
            output_path = "$XDG_DATA_HOME/external_css/dark_theme.css";
          };
        };
      };
    };
}
