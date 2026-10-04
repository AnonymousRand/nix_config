{ den, ... }: {
  den.aspects.profiles.base = {
    includes = [
      # set basic user info like `home.username` and `home.homeDirectory` from entity's username
      den.batteries.define-user

      den.aspects.features.desktop.xdg

      den.aspects.features.fonts.fontconfig

      den.aspects.features.tools.brightnessctl
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.desktop-utils
      den.aspects.features.tools.git
    ];
  };
}
