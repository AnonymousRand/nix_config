{ den, ... }: {
  # TODO eventually try if including this is systs schema works?
  den.aspects.systs.base = {
    includes = [
      # activate the "batteries" associated with these settings
      den.aspects.syst-settings.capabilities
      den.aspects.syst-settings.state-version

      # activate these batteries
      den.aspects.batteries.nix-ld
      den.aspects.batteries.overlays

      den.aspects.features.desktop.xdg-mime-apps

      den.aspects.features.terminal.bash

      den.aspects.features.editors.vim

      den.aspects.features.tools.brightnessctl
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.git
    ];

    # these are for aspects that require `profileSettings` (see README in
    # `settings/profile_settings/`)
    provides.to-users.includes = [
      den.aspects.features.desktop.utils

      den.aspects.features.fonts.fontconfig
    ];
  };
}
