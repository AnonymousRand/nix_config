{ den, ... }: {
  den.aspects.profiles.meow = {
    includes = [
      # (scripts require `bash`, `inotifywait`, and `flock`)
      den.aspects.features.terminal.bash
      den.aspects.features.tools.cli-utils
      den.aspects.features.media.satty
      den.aspects.features.media.tesseract
    ];

    homeManager = {
      # copy over scripts for annotated screenshots/OCR (bind these to hotkeys in configs!)
      xdg.configFile."niri/scripts/annotated_screenshot.sh".source =
        ./dotfiles/scripts/annotated_screenshot.sh;
      xdg.configFile."niri/scripts/ocr.sh".source = ./dotfiles/scripts/ocr.sh;
    };
  };
}
