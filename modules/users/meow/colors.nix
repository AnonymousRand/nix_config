{ lib, config, ... }: {
  options.meow.colors = with lib; {
    black             = mkOption { type = types.str; };
    black-light       = mkOption { type = types.str; };

    blue              = mkOption { type = types.str; };
    blue-light        = mkOption { type = types.str; };
    blue-deep         = mkOption { type = types.str; };
    blue-deep-light   = mkOption { type = types.str; };

    green             = mkOption { type = types.str; };
    green-light       = mkOption { type = types.str; };

    orange            = mkOption { type = types.str; };
    orange-light      = mkOption { type = types.str; };
    orange-deep       = mkOption { type = types.str; };
    orange-xdeep      = mkOption { type = types.str; };

    pink              = mkOption { type = types.str; };
    pink-light        = mkOption { type = types.str; };
    pink-xlight       = mkOption { type = types.str; };
    pink-xxlight      = mkOption { type = types.str; };
    pink-xxxlight     = mkOption { type = types.str; };

    red               = mkOption { type = types.str; };

    white             = mkOption { type = types.str; };
    white-dark        = mkOption { type = types.str; };

    material3-palette = mkOption { type = types.attrs; };
    extra-palette     = mkOption { type = types.attrs; };
  };


  config.meow.colors = rec {
    ############################################################################
    ## basic color variables

    black             = "#000000";
    black-light       = "#808080";

    blue              = "#00eaff";
    blue-light        = "#80f4ff";
    blue-deep         = "#00a6ff";
    blue-deep-light   = "#80d2ff";

    green             = "#8cff00";
    green-light       = "#a9ff40";

    orange            = "#ffd500";
    orange-light      = "#ffdf40";
    orange-deep       = "#ffbf00";
    orange-xdeep      = "#ffa200";

    pink              = "#ff0095";
    pink-light        = "#ff9ed8";
    pink-xlight       = "#ffb3e0";
    pink-xxlight      = "#ffd1ed";
    pink-xxxlight     = "#ffe0f3";

    red               = "#ff0000";

    white             = "#ffffff";
    white-dark        = "#cccccc";

    ############################################################################
    ## Material 3 palette (e.g. for Noctalia palette)

    material3-palette = {
      light = rec {
        mSurface          = "#ffebf2";    # main background color
        mOnSurface        = "#303030";    # main foreground color
        mSurfaceVariant   = white;        # secondary background color (cards, panels)
        mOnSurfaceVariant = mOnSurface;   # secondary foreground color
        mPrimary          = pink-xlight;  # primary accent (buttons, links, highlights)
        mOnPrimary        = black;        # text on primary surfaces
        mSecondary        = orange-light; # secondary accent
        mOnSeconary       = mOnPrimary;   # text on secondary surfaces
        mTertiary         = blue-light;   # tertiary accent
        mOnTertiary       = mOnPrimary;   # text on tertiary surfaces
        mError            = red;          # error color
        mOnError          = black;        # text on error surfaces
        mOutline          = pink-xlight;  # borders and dividers
        mShadow           = mSurface;     # shadows
        mHover            = mTertiary;    # hover state background
        mOnHover          = mOnTertiary;  # text on hover surfaces
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = pink-xxlight;
          cursorText  = foreground;
          selectionBg = pink-xxlight;
          selectionFg = foreground;
          normal = {
            black   = black;
            red     = red;
            green   = green;
            yellow  = orange;
            blue    = blue-deep;
            magenta = pink-light;
            cyan    = blue;
            white   = white-dark;
          };
          bright = {
            black   = black-light;
            red     = red;
            green   = green-light;
            yellow  = orange-light;
            blue    = blue-deep-light;
            magenta = pink-xlight;
            cyan    = blue-light;
            white   = white;
          };
        };
      };

      dark = rec {
        mSurface          = black;
        mOnSurface        = white-dark;
        mSurfaceVariant   = "#202020";
        mOnSurfaceVariant = mOnSurface;
        mPrimary          = pink-xlight;
        mOnPrimary        = black;
        mSecondary        = orange-light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = blue-light;
        mOnTertiary       = mOnPrimary;
        mError            = red;
        mOnError          = black;
        mOutline          = pink-xxlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = pink-xxlight;
          cursorText  = background;
          selectionBg = pink-xxlight;
          selectionFg = background;
          normal = {
            black   = black;
            red     = red;
            green   = green;
            yellow  = orange;
            blue    = blue-deep;
            magenta = pink-light;
            cyan    = blue;
            white   = white-dark;
          };
          bright = {
            black   = black-light;
            red     = red;
            green   = green-light;
            yellow  = orange-light;
            blue    = blue-deep-light;
            magenta = pink-xlight;
            cyan    = blue-light;
            white   = white;
          };
        };
      };
    };
 
    ############################################################################
    ## extra color roles and variables (currently in format for Noctalia custom colors)

    extra-palette = {
      classes = {
        color_light = orange;
        color_dark  = orange;
      };

      comments = {
        color_light = green;
        color_dark  = green-light;
      };

      constants = {
        color_light = blue;
        color_dark  = blue-light;
      };

      functions = {
        color_light = orange-deep;
        color_dark  = orange;
      };

      keywords = {
        color_light = pink-xlight;
        color_dark  = pink-xxlight;
      };

      variables = {
        color_light = material3-palette.light.mOnSurface;
        color_dark  = material3-palette.dark.mOnSurface;
      };

      urgent = {
        color_light = orange-xdeep;
        color_dark  = orange-deep;
      };

      very-urgent = {
        color_light = red;
        color_dark  = red;
      };
    };
  };
}
