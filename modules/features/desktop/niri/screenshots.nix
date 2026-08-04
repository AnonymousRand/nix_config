{ den, ... }: {
  den.aspects.features.desktop.niri.screenshots = {
    includes = [
      # (scripts require `bash`, `inotifywait`, and `flock`)
      den.aspects.features.terminal.bash
      den.aspects.features.tools.cli-utils
    ];

    homeManager = { systSettings, lib, pkgs, ... }:
      lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
        home.packages = [
          pkgs.tesseract # OCR
        ];

        programs.satty.enable = true; # annotated screenshots

        # copy over scripts for annotated screenshots/OCR (bind these to hotkeys in configs!)
        xdg.configFile."niri/scripts/annotated_screenshot.sh".source = ./dotfiles/scripts/annotated_screenshot.sh;
        xdg.configFile."niri/scripts/ocr.sh".source = ./dotfiles/scripts/ocr.sh;
      };
  };
}
