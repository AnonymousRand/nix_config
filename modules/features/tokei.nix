{
  den.aspects.tokei = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.tokei
      ];
    };
  };
}
