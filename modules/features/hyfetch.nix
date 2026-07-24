{
  # TODO: remove when merged + nixpkgs updated
  # my own fork with NixOwOS support and lightness per light/dark mode settings :3
  perSystem = { pkgs, ... }: {
    overlayAttrs.hyfetch = pkgs.hyfetch.overrideAttrs (previousAttrs: {
      src = pkgs.fetchFromGitHub {
        owner = "AnonymousRand";
        repo = "hyfetch";
        rev = "6e75c755c71d255efe0167cca271b963b12f41af";
        hash = "sha256-xxjDbZqJPWNeaW/yKaqEZAMzJEcPRP36YE9dUZJgYvM=";
      };
    });
  };

  den.aspects.hyfetch = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.hyfetch
      ];
    };
  };
}
