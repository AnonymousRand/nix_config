{
  # - `paths-to-compile` are the paths containing all the SCSS files to compile
  # - `paths-to-load` are the SCSS paths to be loaded with `sass --load-path` (for imports in
  #   other SCSS files without needing relative paths). provide directories, not single files
  den.quirks.quirks-compile-scss-paths-to-compile = {};
  den.quirks.quirks-compile-scss-paths-to-load = {};

  den.aspects.batteries.compile-scss = {
    homeManager =
      { quirks-compile-scss-paths-to-compile, quirks-compile-scss-paths-to-load, lib, pkgs, ... }:
        let
          compileScss = { dart-sass, stdenv }: stdenv.mkDerivation {
            pname = "compile-scss";
            version = "0.0.0";

            # input scss files to be copied into build environment
            srcs = quirks-compile-scss-paths-to-load ++ quirks-compile-scss-paths-to-compile;
            # don't try to unpack single files in `srcs` as archives
            dontUnpack = true;

            # build-time dependencies
            nativeBuildInputs = [
              dart-sass
            ];

            # wrap noctalia template syntax in the scss files in quotes so sass compiles
            # (i could render the templates before running sass with `noctalia theme`, but then
            # the resulting css won't see and be tracked by noctalia's light/dark mode changes)
            # (vewwy jank :p)
            preBuild = ''
              find . -name '*.scss' -type f -exec sed -i 's/\({{ *\?colors\..\+\?}}\)/"\1"/g' {} +
            '';

            # render scss to css and place the generated css in `build/` in build environment
            buildPhase =
              let
                loadPathArgs = builtins.foldl'
                  (acc: entry: acc + " --load-path ${entry}") "" quirks-compile-scss-paths-to-load;

                sassCommands = builtins.foldl'
                  (
                    acc: entry:
                      acc + "\nsass ${entry}:build/${builtins.baseNameOf entry}" +
                        " --no-source-map ${loadPathArgs}"
                  )
                  "" quirks-compile-scss-paths-to-compile;
              in
              ''
                set -x # print out all commands for debugging; view with `-L` on `nixos-rebuild`
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

            # take all noctalia template syntax in the generated css files back out of quotes lmao
            # (since css doesn't recognize hex codes inside quotes/strings)
            postInstall = ''
              find $out -name '*.css' -type f -exec \
                sed -i 's/"\({{ *\?colors\..\+\?}}\)"/\1/g' {} +
            '';
          };
        in
        {
          options.aspects.batteries.compile-scss.cssOutput = lib.mkOption {
            type = lib.types.package;
            readOnly = true;
            default = pkgs.callPackage compileScss {};
          }; 
        };
  };
}
