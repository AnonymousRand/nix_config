{ lib, config, ... }: {
  options.meow.colors = with lib; {
    color-vars        = mkOption { type = types.attrs; };
    color-roles       = mkOption { type = types.attrs; };
    material3-palette = mkOption { type = types.attrs; };
  };


  config.meow.colors = rec {
    ############################################################################
    # basic color variables
    # (avoid using these directly in templates as much as possible)

    color-vars = {
      black             = "#000000";
      gray_xdark        = "#303030";
      gray_dark         = "#707070";
      gray              = "#808080";
      gray_light        = "#a0a0a0";
      gray_xlight       = "#cccccc";
      white             = "#ffffff";

      blue              = "#00eaff";
      blue_light        = "#40efff";
      blue_deep         = "#00d0ff";
      blue_xdeep        = "#00bfff";
      blue_xdeep_light  = "#42d0ff";

      green             = "#8cff00";
      green_light       = "#a9ff40";
      green_deep        = "#8cff00";
      green_deep_dark   = "#7ee600";
      green_deep_xdark  = "#70cc00";

      orange            = "#ffd500";
      orange_light      = "#ffdb26";
      orange_deep       = "#ffbf00";
      orange_xdeep      = "#ffac00";
      orange_xxdeep     = "#ff9500";

      pink              = "#ff0080";
      pink_light        = "#ff8cc6";
      pink_xlight       = "#ffabd5";
      pink_xxlight      = "#ffc7e3";
      pink_xxxlight     = "#ffd1e8";
      pink_xxxxlight    = "#ffe0f0";

      red               = "#ff0000";
    };
 
    ############################################################################
    # custom color roles/variables (currently in format for Noctalia custom colors)
    # (use these on things which very clearly have any of the following roles!)

    color-roles = with color-vars; rec {
      default_bg = {
        color_light = "#feedf3";
        color_dark  = black;
      };
      default_fg = {
        color_light = gray_dark;
        color_dark  = gray_xlight;
      };


      selection_bg = {
        color_light = pink_xxxlight;
        color_dark  = pink_xxxlight;
      };
      selection_fg = {
        color_light = default_fg.color_light;
        color_dark  = default_bg.color_dark;
      };


      error = {
        color_light = red;
        color_dark  = red;
      };
      warning = {
        color_light = orange_xxdeep;
        color_dark  = orange_deep;
      };


      classes = {
        color_light = orange_xdeep;
        color_dark  = orange;
      };
      comments = {
        color_light = green_deep_xdark;
        color_dark  = green_light;
      };
      constants = {
        color_light = blue_deep;
        color_dark  = blue_light;
      };
      functions = {
        color_light = orange_xdeep;
        color_dark  = orange;
      };
      keywords = {
        color_light = pink_xxlight;
        color_dark  = pink_xxxlight;
      };
      variables = default_fg;
    };

    ############################################################################
    # Material 3 palette (e.g. for Noctalia palette)
    # (use these on things which very clearly have a Material 3 role!)
    # (although treat the terminal ANSI colors more like fixed color variables)

    material3-palette = {
      light = rec {
        mSurface          = color-roles.default_bg.color_light; # main background color
        mOnSurface        = color-roles.default_fg.color_light; # main foreground color
        mSurfaceVariant   = color-vars.white;                   # secondary background color (cards, panels)
        mOnSurfaceVariant = color-vars.gray_light;              # secondary foreground color
        mPrimary          = color-vars.pink_xxlight;            # primary accent (buttons, links, highlights)
        mOnPrimary        = color-vars.gray_xdark;              # text on primary surfaces
        mSecondary        = color-vars.blue;                    # secondary accent
        mOnSeconary       = mOnPrimary;                         # text on secondary surfaces
        mTertiary         = color-vars.orange;                  # tertiary accent
        mOnTertiary       = mOnPrimary;                         # text on tertiary surfaces
        mError            = color-vars.red;                     # error color
        mOnError          = color-vars.black;                   # text on error surfaces
        mOutline          = color-vars.pink_xxlight;            # borders and dividers
        mShadow           = mSurface;                           # shadows
        mHover            = mTertiary;                          # hover state background
        mOnHover          = mOnTertiary;                        # text on hover surfaces

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink_xxlight;
          cursorText  = foreground;
          selectionBg = color-roles.selection_bg.color_light;
          selectionFg = color-roles.selection_fg.color_light;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink_light;
            green   = color-vars.green_deep_dark;
            yellow  = color-vars.orange_xdeep;
            blue    = color-vars.blue_xdeep_light;
            magenta = color-vars.pink_light;
            cyan    = color-vars.blue;
            white   = color-vars.gray_xlight;
          };
          bright = {
            black   = color-vars.gray_xdark;
            red     = color-vars.red;
            green   = color-vars.green_deep_xdark;
            yellow  = color-vars.orange_xdeep;
            blue    = color-vars.blue_xdeep;
            magenta = color-vars.pink_light;
            cyan    = color-vars.blue_deep;
            white   = color-vars.white;
          };
        };
      };

      dark = rec {
        mSurface          = color-roles.default_bg.color_dark;
        mOnSurface        = color-roles.default_fg.color_dark;
        mSurfaceVariant   = color-vars.gray_xdark;
        mOnSurfaceVariant = color-vars.gray_light;
        mPrimary          = color-vars.pink_xxlight;
        mOnPrimary        = color-vars.gray_xdark;
        mSecondary        = color-vars.blue_light;
        mOnSeconary       = mOnPrimary;
        mTertiary         = color-vars.orange;
        mOnTertiary       = mOnPrimary;
        mError            = color-vars.red;
        mOnError          = color-vars.black;
        mOutline          = color-vars.pink_xxxlight;
        mShadow           = mSurface;
        mHover            = mTertiary;
        mOnHover          = mOnTertiary;

        terminal = rec {
          background  = mSurface;
          foreground  = mOnSurface;
          cursor      = color-vars.pink_xxxlight;
          cursorText  = background;
          selectionBg = color-roles.selection_bg.color_dark;
          selectionFg = color-roles.selection_fg.color_dark;
          normal = {
            black   = color-vars.black;
            red     = color-vars.pink_xlight;
            green   = color-vars.green;
            yellow  = color-vars.orange;
            blue    = color-vars.blue_xdeep;
            magenta = color-vars.pink_xlight;
            cyan    = color-vars.blue;
            white   = color-vars.gray_xlight;
          };
          bright = {
            black   = color-vars.gray_xdark;
            red     = color-vars.red;
            green   = color-vars.green_light;
            yellow  = color-vars.orange_light;
            blue    = color-vars.blue_xdeep_light;
            magenta = color-vars.pink_xxlight;
            cyan    = color-vars.blue_light;
            white   = color-vars.white;
          };
        };
      };
    };
  };
}
