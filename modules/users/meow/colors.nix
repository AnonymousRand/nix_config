{ lib, config, ... }: {
  ##############################################################################
  # color variables


  options.meow.colors = with lib; {
    black           = mkOption { type = types.str; };
    black-light     = mkOption { type = types.str; };

    blue            = mkOption { type = types.str; };
    blue-light      = mkOption { type = types.str; };
    blue-deep       = mkOption { type = types.str; };
    blue-deep-light = mkOption { type = types.str; };

    green           = mkOption { type = types.str; };
    green-light     = mkOption { type = types.str; };

    orange          = mkOption { type = types.str; };
    orange-light    = mkOption { type = types.str; };
    orange-deep     = mkOption { type = types.str; };
    orange-xdeep    = mkOption { type = types.str; };

    pink            = mkOption { type = types.str; };
    pink-light      = mkOption { type = types.str; };
    pink-xlight     = mkOption { type = types.str; };
    pink-xxlight    = mkOption { type = types.str; };

    red             = mkOption { type = types.str; };

    white           = mkOption { type = types.str; };
    white-dark      = mkOption { type = types.str; };
  };


  # TODO: consider having light and dark mode color variables, then remove distinction
  # between light and dark mode presets below, and use global theme variable to determine whether
  # light or dark variable from meow.colors pulled? maybe better for kitty ansi colors, for example
  config.meow.colors = {
    black           = "#000000";
    black-light     = "#808080";

    blue            = "#00eaff";
    blue-light      = "#80f4ff";
    blue-deep       = "#00a6ff";
    blue-deep-light = "#80d2ff";

    green           = "#8cff00";
    green-light     = "#a9ff40";

    orange          = "#ffd500";
    orange-light    = "#ffdf40";
    orange-deep     = "#ffbf00";
    orange-xdeep    = "#ffaa00";

    pink            = "#ff0095";
    pink-light      = "#ffbae3";
    pink-xlight     = "#ffd1ed";
    pink-xxlight    = "#ffe0f3";

    red             = "#ff0000";

    white           = "#ffffff";
    white-dark      = "#cccccc";
  };


  ##############################################################################
  # light mode color presets


  options.meow.colors-light = with lib; {
    background                    = mkOption { type = types.str; };
    background-secondary          = mkOption { type = types.str; };
    foreground                    = mkOption { type = types.str; };
    foreground-secondary          = mkOption { type = types.str; };

    status-bar-background         = mkOption { type = types.str; };
    status-bar-foreground         = mkOption { type = types.str; };

    selection-background          = mkOption { type = types.str; };
    selection-foreground          = mkOption { type = types.str; };
    selection-discreet-background = mkOption { type = types.str; };
    selection-discreet-foreground = mkOption { type = types.str; };

    textcursor-background         = mkOption { type = types.str; };
    textcursor-foreground         = mkOption { type = types.str; };

    classes                       = mkOption { type = types.str; };
    comments                      = mkOption { type = types.str; };
    constants                     = mkOption { type = types.str; };
    functions                     = mkOption { type = types.str; };
    keywords                      = mkOption { type = types.str; };
    variables                     = mkOption { type = types.str; };
    urgent                        = mkOption { type = types.str; };
    very-urgent                   = mkOption { type = types.str; };
  };


  config.meow.colors-light = with config.meow.colors; rec {
    background                    = white;
    background-secondary          = white-dark;
    foreground                    = "#303030";
    foreground-secondary          = "#484848";

    status-bar-background         = pink-xlight;
    status-bar-foreground         = foreground;

    selection-background          = pink-xxlight;
    selection-foreground          = foreground;
    selection-discreet-background = "#b8b8b8";
    selection-discreet-foreground = foreground;

    textcursor-background         = pink-xlight;
    textcursor-foreground         = foreground;

    classes                       = orange;
    comments                      = green;
    constants                     = blue;
    functions                     = orange-deep;
    keywords                      = pink-light;
    variables                     = foreground;
    urgent                        = orange-xdeep;
    very-urgent                   = red;
  };


  ##############################################################################
  # dark mode color presets


  options.meow.colors-dark = with lib; {
    background                    = mkOption { type = types.str; };
    background-secondary          = mkOption { type = types.str; };
    foreground                    = mkOption { type = types.str; };
    foreground-secondary          = mkOption { type = types.str; };

    status-bar-background         = mkOption { type = types.str; };
    status-bar-foreground         = mkOption { type = types.str; };

    selection-background          = mkOption { type = types.str; };
    selection-foreground          = mkOption { type = types.str; };
    selection-discreet-background = mkOption { type = types.str; };
    selection-discreet-foreground = mkOption { type = types.str; };

    textcursor-background         = mkOption { type = types.str; };
    textcursor-foreground         = mkOption { type = types.str; };

    classes                       = mkOption { type = types.str; };
    comments                      = mkOption { type = types.str; };
    constants                     = mkOption { type = types.str; };
    functions                     = mkOption { type = types.str; };
    keywords                      = mkOption { type = types.str; };
    variables                     = mkOption { type = types.str; };
    urgent                        = mkOption { type = types.str; };
    very-urgent                   = mkOption { type = types.str; };
  };


  config.meow.colors-dark = with config.meow.colors; rec {
    background                    = "#181818";
    background-secondary          = "#242424";
    foreground                    = white-dark;
    foreground-secondary          = "#b0b0b0";

    status-bar-background         = pink-xlight;
    status-bar-foreground         = background;

    selection-background          = pink-xlight;
    selection-foreground          = background;
    selection-discreet-background = "#484848";
    selection-discreet-foreground = foreground;

    textcursor-background         = pink-xlight;
    textcursor-foreground         = background;

    classes                       = orange;
    comments                      = green-light;
    constants                     = blue-light;
    functions                     = orange;
    keywords                      = pink-xlight;
    variables                     = foreground;
    urgent                        = orange-deep;
    very-urgent                   = red;
  };
}
