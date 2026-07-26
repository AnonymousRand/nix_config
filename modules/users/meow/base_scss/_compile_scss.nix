{
  den.aspects.users.meow = { lib, pkgs, ... }: {
    imports = [
      {
        options = {
          css = lib.mkOption { type = lib.types.package; };
        };
      }
    ];

    css =
      let
        # params:
        # - `pathsToLoad` is the SCSS paths to be loaded with `sass --load-path` (for imports in
        #   other SCSS files without needing relative paths). provide directories, not single files
        # - `pathToCompile` is a path containing all the SCSS files to compile
        compileScss = { dart-sass, stdenv, pathsToLoad, pathToCompile }: stdenv.mkDerivation {
          pname = "compile-scss";
          version = "0.0.0";

          # input SCSS files to be copied into build environment
          srcs = pathsToLoad ++ [ pathToCompile ];
          # don't try to unpack single files in `srcs` as archives
          dontUnpack = true;

          # build-time dependencies
          nativeBuildInputs = [
            dart-sass
          ];

          # wrap Noctalia template syntax in the SCSS files in quotes so sass compiles without error
          # (i could render the templates before running sass with `noctalia theme`, but then
          # the resulting CSS won't see and be tracked by Noctalia's light/dark mode changes)
          # (i apologize for the jank :p)
          preBuild = ''
            find . -name '*.scss' -type f -exec sed -i 's/\({{ *\?colors\..\+\?}}\)/"\1"/g' {} +
          '';

          # render SCSS to CSS and place the generated CSS in `build/` in build environment
          buildPhase = ''
            runHook preBuild

            mkdir build/
            sass ${pathToCompile}:build/ --no-source-map \
                ${builtins.foldl' (acc: entry: acc + " --load-path ${entry}") "" pathsToLoad}
          '';

          # copy `build/*` to the designated output directory for this derivation in the nix store
          # (`$out`), which is accessible via `"${<this package>}/<desired file path>"`
          installPhase = ''
            mkdir -p $out
            cp -r build/* $out/

            runHook postInstall
          '';

          # take all Noctalia template syntax in the generated CSS files back out of quotes lmao
          # (since CSS doesn't recognize hex codes inside quotes/strings)
          postInstall = ''
            find $out -name '*.css' -type f -exec sed -i 's/"\({{ *\?colors\..\+\?}}\)"/\1/g' {} +
          '';
        };
      in
      pkgs.callPackage compileScss {
        pathsToLoad = [
          ./.
        ];
        pathToCompile = ../features;
      };
  };
}
