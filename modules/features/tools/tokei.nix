{
  den.aspects.tools.tokei = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.tokei
      ];
    };
  };
}
