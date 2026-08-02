{
  den.aspects.features.tools.hyfetch = {
    # TODO: remove when merged + nixpkgs updated
    # my own fork with NixOwOS support :3 and lightness per light/dark mode settings
    # (wrapped in a function so den doesn't think the inline overlay is a parametric something idk)
    overlays = _: [
      (final: prev: {
        hyfetch = prev.hyfetch.overrideAttrs (prevAttrs: {
          src = prev.fetchFromGitHub {
            owner = "AnonymousRand";
            repo = "hyfetch";
            rev = "6e75c755c71d255efe0167cca271b963b12f41af";
            hash = "sha256-xxjDbZqJPWNeaW/yKaqEZAMzJEcPRP36YE9dUZJgYvM=";
          };
        });
      })
    ];

    homeManager = {
      programs.hyfetch = {
        enable = true;
      };
    };
  };
}
