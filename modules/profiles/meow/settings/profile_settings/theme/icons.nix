{
  den.profiles.meow = {
    settings.theme.icons = {
      list = {
        adwaita = {
          iconThemeName = "Adwaita";
          package = pkgs: pkgs.adwaita-icon-theme;
        };
      };

      default = "adwaita";
    };
  };
}
