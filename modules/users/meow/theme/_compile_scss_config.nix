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

  flake.nixosModules.compile-scss-config = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.compile-scss-config
    ];
  };
}
