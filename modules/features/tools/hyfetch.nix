{
  den.aspects.features.tools.hyfetch = {
    # TODO: remove when merged + nixpkgs updated
    # my own fork with NixOwOS support and lightness per light/dark mode settings :3
    # (wrapped in a function so den doesn't think the inline overlay is a parametric something idk)
    overlays = _: [
      (final: prev: {
        hyfetch = prev.hyfetch.overrideAttrs (previousAttrs: {
          src = prev.fetchFromGitHub {
            owner = "AnonymousRand";
            repo = "hyfetch";
            rev = "6e75c755c71d255efe0167cca271b963b12f41af";
            hash = "sha256-xxjDbZqJPWNeaW/yKaqEZAMzJEcPRP36YE9dUZJgYvM=";
          };
        });
      })
    ];

    homeManager = { pkgs, ... }: {
      programs.hyfetch = {
        enable = true;
        package = pkgs.hyfetch;
      };
    };
  };
}
