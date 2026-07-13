{
  perSystem = { self', inputs', pkgs, my, ... }: {
    packages.compile-scss-config =
      let
        paletteJson = pkgs.writeText "palette.json" (builtins.toJSON my.theme.colors.m3-palette);
        configToml = (pkgs.formats.toml { }).generate "config.toml" my.theme.noctalia-custom-colors;
      in
        pkgs.stdenv.mkDerivation {
          pname = "compile-scss-config";
          version = "0.0.0";

          # input SCSS files to be copied into build environment
          srcs = [
            ./_base.scss
            ../../features
          ];

          # SCSS files that should be rendered by Noctalia before being rendered by sass
          # these should be the only SCSS files with Noctalia template syntax!!
          # (this is a custom option)
          scssFilesToRender = [
            ./_base.scss
          ];

          # SCSS files to be loaded with `sass --load-path` (for imports in other SCSS files
          # without needing relative paths)
          scssFilesToLoadPath = [
            ./_base.scss
          ];

          # build-time dependencies
          nativeBuildInputs = [
            pkgs.sass
            inputs'.noctalia.packages.default
          ];

          # build
          # 2 steps:
          # 1. render base SCSS files as Noctalia templates (so SCSS syntax is correct)
          # 2. compile all SCSS files for all apps, and output the resulting CSS to
          #    the designated output directory for this derivation in the nix store ($out),
          #    which is accessible via `"${<this package>}/<desired file path>"` in home manager etc.
          buildPhase = ''
            noctalia theme --theme-json ${paletteJson} -c ${configToml} --both \
                ${builtins.foldl' (acc: elem: acc + " -r ${elem}:${elem}") "" scssFilesToRender}

            sass ${../../features}:$out \
                ${builtins.foldl' (acc: elem: acc + " --load-path ${elem}") "" scssFilesToLoadPath}
          '';
        };
  };
}
