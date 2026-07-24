{
  den.aspects.features.tools.tokei = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.tokei
      ];
    };
  };
}
