{
  den.aspects.users.meow.homeManager = { pkgs, ... }:
    let
      # `scssPathsToLoad` is the SCSS paths to be loaded with `sass --load-path` (for imports in
      # other SCSS files without needing relative paths). provide directories, not individual files
      # `featuresPath` is the path to where all the features' SCSS files are
      compile-scss = { dart-sass, stdenv, scssPathsToLoad, featuresPath }: stdenv.mkDerivation {
        pname = "compile-scss";
        version = "0.0.0";

        # input SCSS files to be copied into build environment
        srcs = scssPathsToLoad ++ [ featuresPath ];
        # don't try to unpack single files in `srcs` as archives
        dontUnpack = true;

        # build-time dependencies
        nativeBuildInputs = [
          dart-sass
        ];

        # wrap all Noctalia template syntax in the SCSS files in quotes so sass compiles without error
        # (i could render the templates before running sass with `noctalia theme`, but then
        # the resulting CSS won't see and be tracked by Noctalia's light/dark mode changes)
        # (i would like to apologize for the sheer absurdity of this hack)
        preBuild = ''
          find . -name '*.scss' -type f -exec sed -i 's/\({{ *\?colors\..\+\?}}\)/"\1"/g' {} +
        '';

        # render SCSS to CSS using sass, and place generated CSS in `build/` in build environment
        buildPhase = ''
          runHook preBuild

          mkdir build/
          sass ${featuresPath}:build/ --no-source-map \
              ${builtins.foldl' (acc: entry: acc + " --load-path ${entry}") "" scssPathsToLoad}
        '';

        # copy `build/*` to the designated output directory for this derivation in nix store (`$out`),
        # which is accessible via `"${<this package>}/<desired file path>"` in home manager etc.
        installPhase = ''
          mkdir -p $out
          cp -r build/* $out/

          runHook postInstall
        '';

        # take all the Noctalia template syntax in the generated CSS files back out of quotes lmao
        # (since CSS doesn't recognize hex codes inside quotes/strings)
        postInstall = ''
          find $out -name '*.css' -type f -exec sed -i 's/"\({{ *\?colors\..\+\?}}\)"/\1/g' {} +
        '';
      };
    in
    {
      theme.css = pkgs.callPackage compile-scss {
        scssPathsToLoad = [
          ./.
        ];
        featuresPath = ../../features;
      };
    };
}
