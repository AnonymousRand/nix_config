{
  den.aspects.features.tools.gpg = {
    homeManager = { pkgs, ... }: {
      programs.gpg.enable = true;
      services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-curses; # tty passphrase prompter
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
