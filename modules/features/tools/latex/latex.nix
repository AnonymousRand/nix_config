{
  den.aspects.features.tools.latex = {
    homeManager = { pkgs, ... }: {
      # note: currently `programs.texlive` is outdated in terms of what package names it uses
      home.packages = [
        pkgs.texliveFull
      ];
    };
  };
}
