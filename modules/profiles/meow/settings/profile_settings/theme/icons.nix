{
  den.profiles.meow = {
    settings.theme.icons = {
      list = {
        papirus = {
          iconThemeName = "Papirus";
          package = pkgs: pkgs.papirus-icon-theme;
        };
      };

      default = "papirus";
    };
  };
}
