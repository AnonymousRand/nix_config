{
  meow.features.fonts.maple-mono = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.maple-mono.NF
      ];

      fonts.fontconfig = {
        configFile.mapleMono = {
          enable = true;
          label = "maple-mono";
          priority = 90;
          source = ./dotfiles/maple_mono.conf;
        };
      };
    };
  };
}
