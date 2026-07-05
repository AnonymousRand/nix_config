{ lib, config, ... }: {
  options.meow.colors = with lib; {
    color-vars        = mkOption { type = types.attrs; };
    material3-palette = mkOption { type = types.attrs; };
    extra-palette     = mkOption { type = types.attrs; };
  };


  config.meow.colors = rec {
    ############################################################################
    ## basic color variables

    color-vars = {
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
      orange-xdeep    = "#ffa200";

      pink            = "#ff0095";
      pink-light      = "#ff9ed8";
      pink-xlight     = "#ffb3e0";
      pink-xxlight    = "#ffd1ed";
      pink-xxxlight   = "#ffe0f3";

      red             = "#ff0000";

      white           = "#ffffff";
      white-dark      = "#cccccc";
    };

    ############################################################################
    ## Material 3 palette (e.g. for Noctalia palette)

    material3-palette = {
      light = rec {
        mSurface          = "#ffebf2";               # main background color
        mOnSurface        = "#303030";               # main foreground color
        mSurfaceVariant   = color-vars.white;        # secondary background color (cards, panels)
        mOnSurfaceVariant = mOnSurface;              # secondary foreground color
        mPrimary          = color-vars.pink-xlight;  # primary accent (buttons, links, highlights)
        mOnPrimary        = color-vars.black;        # text on primary surfaces
        mSecondary        = color-vars.orange-light; # secondary accent
        mOnSeconary       = mOnPrimary;              # text on secondary surfaces
        mTertiary         = color-vars.blue-light;   # tertiary accent
        mOnTertiary       = mOnPrimary;              # text on tertiary surfaces
        mError            = color-vars.red;          # error color
        mOnError          = color-vars.black;        # text on error surfaces
        mOutline          = color-vars.pink-xlight;  # borders and dividers
        mShadow           = mSurface;                # shadows
        mHover            = mTertiary;               # hover state background
        mOnHover          = mOnTertiary;             # text on hover surfaces
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxlight;
          cursorText  = foreground;
          selectionBg = color-vars.pink-xxlight;
          selectionFg = foreground;
          normal = {
            black   = color-vars.black;
            red     = color-vars.red;
            green   = color-vars.green;
            yellow  = color-vars.orange;
            blue    = color-vars.blue-deep;
            magenta = color-vars.pink-light;
            cyan    = color-vars.blue;
            white   = color-vars.white-dark;
          };
          bright = {
            black   = color-vars.black-light;
            red     = color-vars.red;
            green   = color-vars.green-light;
            yellow  = color-vars.orange-light;
            blue    = color-vars.blue-deep-light;
            magenta = color-vars.pink-xlight;
            cyan    = color-vars.blue-light;
            white   = color-vars.white;
          };
        };
      };

      dark = rec {
        mSurface          = color-vars.black;
        mOnSurface        = color-vars.white-dark;
        mSurfaceVariant   = "#202020";
        mOnSurfaceVariant = mOnSurface;
        mPrimary          = color-vars.pink-xlight;
        mOnPrimary        = color-vars.black;
        mSecondary        = color-vars.orange-light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = color-vars.blue-light;
        mOnTertiary       = mOnPrimary;
        mError            = color-vars.red;
        mOnError          = color-vars.black;
        mOutline          = color-vars.pink-xxlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;
        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink-xxlight;
          cursorText  = background;
          selectionBg = color-vars.pink-xxlight;
          selectionFg = background;
          normal = {
            black   = color-vars.black;
            red     = color-vars.red;
            green   = color-vars.green;
            yellow  = color-vars.orange;
            blue    = color-vars.blue-deep;
            magenta = color-vars.pink-light;
            cyan    = color-vars.blue;
            white   = color-vars.white-dark;
          };
          bright = {
            black   = color-vars.black-light;
            red     = color-vars.red;
            green   = color-vars.green-light;
            yellow  = color-vars.orange-light;
            blue    = color-vars.blue-deep-light;
            magenta = color-vars.pink-xlight;
            cyan    = color-vars.blue-light;
            white   = color-vars.white;
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

      error = {
        color_light = red;
        color_dark  = red;
      };

      functions = {
        color_light = orange-deep;
        color_dark  = orange;
      };

      keywords = {
        color_light = pink-xlight;
        color_dark  = pink-xxlight;
      };

      selection_discreet = {
        color_light = pink-xxlight;
        color_dark  = "#484848";
      };

      variables = {
        color_light = material3-palette.light.mOnSurface;
        color_dark  = material3-palette.dark.mOnSurface;
      };

      warning = {
        color_light = orange-xdeep;
        color_dark  = orange-deep;
      };
    };
  };
}
