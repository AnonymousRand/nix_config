let
  aspectName = "compile-scss";
in
{
  den.aspects.batteries.theme.${aspectName} = {
    homeManager = { config, lib, pkgs, ... }:
      let
        cfg = config.batteries.theme.${aspectName};
      in
      {
        # declare these options in the home manager module (aspect-level doesn't seem to work)
        #
        # options:
        # - `pathsToCompile` are the paths containing all the SCSS files to compile
        # - `pathsToLoad` are the SCSS paths to be loaded with `sass --load-path` (for imports in
        #   other SCSS files without needing relative paths). provide directories, not single files
        options.batteries.theme.${aspectName} = lib.mkOption {
          type = lib.types.submodule {
            options = {
              pathsToCompile = lib.mkOption {
                type = lib.types.listOf lib.types.path;
              };

              pathsToLoad = lib.mkOption {
                type = lib.types.listOf lib.types.path;
                default = [];
              };

              cssOutput = lib.mkOption {
                type = lib.types.package;
                readOnly = true;
              };
            };
          };

          default = {};
        };

        config =
          let
            compileScss = { dart-sass, stdenv }: stdenv.mkDerivation {
              pname = "compile-scss";
              version = "0.0.0";

              # input SCSS files to be copied into build environment
              srcs = cfg.pathsToLoad
                ++ cfg.pathsToCompile;
              # don't try to unpack single files in `srcs` as archives
              dontUnpack = true;

              # build-time dependencies
              nativeBuildInputs = [
                dart-sass
              ];

              # wrap noctalia template syntax in the SCSS files in quotes so sass compiles without error
              # (i could render the templates before running sass with `noctalia theme`, but then
              # the resulting CSS won't see and be tracked by noctalia's light/dark mode changes)
              # (i apologize for the jank :p)
              preBuild = ''
                find . -name '*.scss' -type f -exec sed -i 's/\({{ *\?colors\..\+\?}}\)/"\1"/g' {} +
              '';

              # render SCSS to CSS and place the generated CSS in `build/` in build environment
              buildPhase =
                let
                  loadPathArgs = builtins.foldl'
                    (acc: entry: acc + " --load-path ${entry}") "" cfg.pathsToLoad;

                  sassCommands = builtins.foldl'
                    (
                      acc: entry:
                        acc + "\nsass ${entry}:build/${builtins.baseNameOf entry}" +
                          " --no-source-map ${loadPathArgs}"
                    )
                    "" cfg.pathsToCompile;
                in
                ''
                  runHook preBuild

                  mkdir build/
                  ${sassCommands}
                '';

              # copy `build/*` to the designated output directory for this derivation in the nix store
              # (`$out`), which is accessible via `"${<this package>}/<desired file path>"`
              installPhase = ''
                mkdir -p $out
                cp -r build/* $out/

                runHook postInstall
              '';

              # take all noctalia template syntax in the generated CSS files back out of quotes lmao
              # (since CSS doesn't recognize hex codes inside quotes/strings)
              postInstall = ''
                find $out -name '*.css' -type f -exec sed -i 's/"\({{ *\?colors\..\+\?}}\)"/\1/g' {} +
              '';
            };
          in
          {
            batteries.theme.${aspectName}.cssOutput = pkgs.callPackage compileScss {};
          };
      };
  };
}
