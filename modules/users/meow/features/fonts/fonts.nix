{
  meow.features.fonts.fonts = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.maple-mono.NF
      ];
    };
  };
}
