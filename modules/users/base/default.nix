{ den, ... }: {
  den.aspects.users.base = {
    # aspects to be included in every user entity
    includes = [
      # set basic user info
      den.batteries.define-user
      # allows `homeManager` etc. class modules from hosts to be automatically forwarded to all
      # users on that host (which include this battery), without needing `provides.to-users`
      den.batteries.host-aspects

      den.aspects.features.desktop.xdg-mime-apps

      den.aspects.features.fonts.fontconfig

      den.aspects.features.tools.brightnessctl
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.desktop-utils
    ];
  };
}
