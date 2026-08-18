{
  den.aspects.features.theme.fonts.maple-mono = {
    nixos = { pkgs, ... }: {
      fonts.packages = [
        pkgs.maple-mono.NF
      ];
    };

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.maple-mono.NF
      ];
    };
  };
}
