# custom colors are also put here instead of in `theme.templates` so that template engine
# can see them when running by itself (e.g. via `noctalia theme` CLI)
# when run normally with noctalia startup/config loading, `theme.templates` seems to be used
# instead to render templates, so all changes here must also be copied to `theme.templates`


{ self, ... }: {
  perSystem = { pkgs, ... }: {
    packages.compile-scss-config = pkgs.stdenv.mkDerivation {
      pname = "compile-scss-config";
      version = "0.0.0";

      # input SCSS files
      srcs = [
        ./_base.scss
        ../dotfiles/
      ];

      # build-time dependencies
      nativeBuildInputs = [
        pkgs.sass
      ];

      # build (compile SCSS files into CSS)
      buildPhase = ''
        sass ../dotfiles/:../dotfiles/
      '';

      # copy generated CSS files from temporary build environment to nix store for later use by home manager
    };
  };
}
