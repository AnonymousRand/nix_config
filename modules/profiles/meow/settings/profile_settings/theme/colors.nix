{
  den.profiles.meow = {
    settings.theme.colors = rec {
      ##########################################################################
      # basic color variables
      ##########################################################################

      # avoid using these directly in templates etc. as much as possible

      vars = {
        # hsv of each color is indicated in comments, mostly using google color picker rounding
        blue              = "#00eaff"; # 185, 100, 100
        blue_light        = "#66f2ff"; # 185, 60 , 100
        blue_xlight       = "#80f4ff"; # 185, 50 , 100
        blue_xxlight      = "#bffaff"; # 185, 25 , 100
        blue_xxxlight     = "#e0fcff"; # 186, 12 , 100
        blue_dark         = "#00c4d6"; # 185, 100, 84
        blue_deep         = "#00d0ff"; # 191, 100, 100
        blue_deep_light   = "#73e5ff"; # 191, 55 , 100
        blue_deep_xlight  = "#8ceaff"; # 191, 45 , 100
        blue_deep_dark    = "#00c8f5"; # 191, 100, 96
        blue_xdeep        = "#00bbff"; # 196, 100, 100
        blue_xdeep_light  = "#33c9ff"; # 196, 80 , 100
        blue_xdeep_xlight = "#59d3ff"; # 196, 65 , 100
        blue_xxdeep       = "#00a6ff"; # 201, 100, 100

        green             = "#b7ff00"; # 77 , 100, 100
        green_light       = "#c9ff40"; # 77 , 75 , 100
        green_xlight      = "#deff8c"; # 77 , 45 , 100
        green_deep        = "#8cff00"; # 87 , 100, 100
        green_deep_light  = "#a3ff33"; # 87 , 80 , 100
        green_deep_xlight = "#baff66"; # 87 , 60 , 100
        green_deep_dark   = "#78da00"; # 87 , 100, 85
        green_deep_xdark  = "#70cc00"; # 87 , 100, 80

        orange               = "#ffd500"; # 50 , 100, 100
        orange_light         = "#ffdb26"; # 50 , 85 , 100
        orange_xlight        = "#ffdf40"; # 50 , 75 , 100
        orange_xxlight       = "#ffec8c"; # 50 , 45 , 100
        orange_shallow       = "#ffea00"; # 55 , 100, 100
        orange_shallow_light = "#fff04d"; # 55 , 70 , 100
        orange_deep          = "#ffbb00"; # 44 , 100, 100
        orange_deep_light    = "#ffc526"; # 44 , 85 , 100
        orange_xdeep         = "#ffaa00"; # 40 , 100, 100
        orange_xxdeep        = "#ff9500"; # 35 , 100, 100
        orange_xxxdeep       = "#ff9500"; # 33 , 100, 100

        pink             = "#ff0080"; # 330, 100, 100
        pink_light       = "#ff409f"; # 330, 75 , 100
        pink_xlight      = "#ff73b9"; # 330, 55 , 100
        pink_xxlight     = "#ff91c8"; # 330, 43 , 100
        pink_xxxlight    = "#ffabd5"; # 330, 33 , 100
        pink_xxxxlight   = "#ffc7e4"; # 329, 22 , 100
        pink_xxxxxlight  = "#ffdbed"; # 330, 14 , 100
        pink_xxxxxxlight = "#ffe6f2"; # 331, 10 , 100

        black         = "#000000";
        gray_xxdark   = "#242424";
        gray_xdark    = "#505050";
        gray_dark     = "#707070";
        gray          = "#808080";
        gray_light    = "#909090";
        gray_xlight   = "#a8a8a8";
        gray_xxlight  = "#cccccc";
        gray_xxxlight = "#f0f0f0";
        white         = "#ffffff";

        red    = "#ff0000";
        purple = "#ff00ea"; # 305, 100, 100
      };

      ##########################################################################
      # color variables/roles that change based on light/dark theme
      ##########################################################################

      # currently in format for noctalia custom colors

      themed = rec {
        ########################################################################
        # themed color vars

        # blue
        blue_deep_dark_fg = {
          color_light = vars.blue_deep_dark;
          color_dark  = vars.blue_light;
        };
        blue_xdeep_fg = {
          color_light = vars.blue_xdeep;
          color_dark  = vars.blue_deep_light;
        };
        blue_xxdeep_fg = {
          color_light = vars.blue_xxdeep;
          color_dark  = vars.blue_deep_xlight;
        };

        # green
        green_border = {
          color_light = vars.green;
          color_dark  = vars.green;
        };
        green_deep_dark_fg = {
          color_light = vars.green_deep_dark;
          color_dark  = vars.green_deep;
        };
        green_deep_xdark_fg = {
          color_light = vars.green_deep_xdark;
          color_dark  = vars.green;
        };

        # orange
        orange_border = {
          color_light = vars.orange;
          color_dark  = vars.orange;
        };
        orange_deep_fg = {
          color_light = vars.orange_deep;
          color_dark  = vars.orange;
        };
        orange_xxdeep_fg = {
          color_light = vars.orange_xxdeep;
          color_dark  = vars.orange_light;
        };
        orange_xxxdeep_fg = {
          color_light = vars.orange_xxxdeep;
          color_dark  = vars.orange_xxlight;
        };

        # pink
        pink_light_fg = {
          color_light = vars.pink_light;
          color_dark  = vars.pink_xxxxlight;
        };
        pink_xlight_fg = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink_xxxlight;
        };
        pink_xxlight_fg = {
          color_light = vars.pink_xxlight;
          color_dark  = vars.pink_xxxlight;
        };
        pink_xxxlight_fg = {
          color_light = vars.pink_xxxlight;
          color_dark  = vars.pink_xxxlight;
        };

        # gray
        black_fg = {
          color_light = vars.black;
          color_dark  = vars.white;
        };
        gray_xxdark_fg = {
          color_light = vars.gray_xxdark;
          color_dark  = vars.gray_xxxlight;
        };
        gray_xdark_fg = {
          color_light = vars.gray_xdark;
          color_dark  = vars.gray_xxlight;
        };
        gray_dark_fg = {
          color_light = vars.gray_dark;
          color_dark  = vars.gray_xxlight;
        };
        gray_fg = {
          color_light = vars.gray;
          color_dark  = vars.gray_xlight;
        };
        gray_xlight_fg = {
          color_light = vars.gray_xlight;
          color_dark  = vars.gray_light;
        };
        gray_xxlight_border = {
          color_light = vars.gray_xxlight;
          color_dark  = vars.gray;
        };
        gray_xxxlight_bg = {
          color_light = vars.gray_xxxlight;
          color_dark  = vars.gray_xdark;
        };
        white_fg = {
          color_light = vars.white;
          color_dark  = vars.black;
        };

        # other
        red_fg = {
          color_light = vars.red;
          color_dark  = vars.red;
        };

        ########################################################################
        # default bg/fg

        default_bg = {
          color_light = "#feedf3";
          color_dark  = vars.black;
        };
        default_fg = gray_dark_fg;
        lighter_fg = gray_xlight_fg;

        ########################################################################
        # variant bg/fg

        # variant 1 (generally lighter in light mode)
        variant_1_border = border_4;
        variant_1_bg = {
          color_light = "#fffafc"; # 336, 2  , 100
          color_dark  = vars.gray_xxdark;
        };
        variant_1_fg      = pink_xxlight_fg;
        variant_1_gray_fg = gray_xdark_fg;

        # variant 2 (generally even lighter/white in light mode)
        variant_2_border = border_4;
        variant_2_bg = {
          color_light = vars.white;
          color_dark  = vars.gray_xdark;
        };
        variant_2_fg      = pink_xlight_fg;
        variant_2_gray_fg = gray_xdark_fg;

        ########################################################################
        # accents

        # accent 1
        accent_1_border_vrnt_1 = border_1;
        accent_1_border_vrnt_2 = border_1;
        accent_1_bg = {
          color_light = vars.pink_xxxlight;
          color_dark  = vars.pink_xlight;
        };
        accent_1_fg = {
          color_light = vars.pink;
          color_dark  = vars.black;
        };

        # accent 2
        accent_2_border        = border_1;
        accent_2_border_vrnt_1 = border_2;
        accent_2_border_vrnt_2 = border_2;
        accent_2_bg = {
          color_light = vars.pink_xxxxlight;
          color_dark  = vars.pink_xxlight;
        };
        accent_2_fg = {
          color_light = vars.pink_light;
          color_dark  = vars.gray_xxdark;
        };

        # accent 3
        accent_3_border        = border_2;
        accent_3_border_vrnt_1 = border_3;
        accent_3_border_vrnt_2 = border_3;
        accent_3_bg = {
          color_light = vars.pink_xxxxxlight;
          color_dark  = vars.pink_xxxlight;
        };
        accent_3_fg = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink;
        };

        # accent 4
        accent_4_border        = border_3;
        accent_4_border_vrnt_1 = border_4;
        accent_4_border_vrnt_2 = border_4;
        accent_4_bg = {
          color_light = vars.pink_xxxxxxlight;
          color_dark  = vars.pink_xxxxlight;
        };
        accent_4_fg = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink_light;
        };

        # default accent
        accent_default_border = accent_4_border;
        accent_default_bg     = accent_4_bg;
        accent_default_fg     = accent_4_fg;

        # secondary accent
        secondary_border = {
          color_light = vars.blue_light;
          color_dark  = vars.blue_light;
        };
        secondary_bg = {
          color_light = vars.blue_xxxlight;
          color_dark  = vars.blue_xxxlight;
        };
        secondary_fg = {
          color_light = vars.blue_dark;
          color_dark  = vars.blue_dark;
        };

        # colored accents
        accent_red_fg = {
          color_light = vars.red;
          color_dark  = vars.red;
        };
        accent_orange_fg = {
          color_light = vars.orange_xdeep;
          color_dark  = vars.orange_deep_light;
        };
        accent_yellow_fg = {
          color_light = vars.orange_xdeep;
          color_dark  = vars.orange_shallow;
        };
        accent_olive_fg = {
          color_light = vars.green_deep_xdark;
          color_dark  = vars.green_deep_dark;
        };
        accent_green_fg = {
          color_light = vars.green_deep_dark;
          color_dark  = vars.green_deep_light;
        };
        accent_teal_fg = {
          color_light = vars.blue_deep;
          color_dark  = vars.blue_xdeep;
        };
        accent_cyan_fg = {
          color_light = vars.blue;
          color_dark  = vars.blue_light;
        };
        accent_blue_fg = {
          color_light = vars.blue_xdeep_xlight;
          color_dark  = vars.blue_xdeep_light;
        };
        accent_indigo_fg = {
          color_light = "#6c00bf"; # 274, 100, 75
          color_dark  = "#6c00bf";
        };
        accent_violet_fg = {
          color_light = "#ff66f2"; # 305, 60 , 100
          color_dark  = "#ff66f2";
        };
        accent_purple_fg = {
          color_light = vars.purple;
          color_dark  = vars.purple;
        };
        accent_pink_fg = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink_xxxlight;
        };
        accent_gold_fg = {
          color_light = vars.orange_deep;
          color_dark  = vars.orange_deep;
        };
        accent_brown_fg = {
          color_light = vars.orange_xxdeep;
          color_dark  = vars.orange_xxdeep;
        };
        accent_gray_fg = gray_xdark_fg;

        ########################################################################
        # borders

        border_1 = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink_light;
        };
        border_2 = {
          color_light = vars.pink_xxlight;
          color_dark  = vars.pink_xlight;
        };
        border_3 = {
          color_light = vars.pink_xxxlight;
          color_dark  = vars.pink_xxlight;
        };
        border_4 = {
          color_light = vars.pink_xxxxlight;
          color_dark  = vars.pink_xxxlight;
        };
        border_5 = {
          color_light = vars.pink_xxxxxlight;
          color_dark  = vars.pink_xxxxlight;
        };
        border_default = border_4;

        ########################################################################
        # interactive colors

        # selection
        selection_bg = {
          color_light = vars.pink_xxxxxlight;
          color_dark  = vars.pink_xxxxlight;
        };
        selection_fg = {
          color_light = vars.pink_xlight;
          color_dark  = vars.pink_light;
        };

        # cursor
        cursor_bg = {
          color_light = vars.pink_xxxxlight;
          color_dark  = vars.pink_xxxxlight;
        };
        cursor_fg = {
          color_light = vars.pink_light;
          color_dark  = vars.pink_light;
        };

        # hover
        hover_bg        = accent_3_bg;
        hover_fg        = accent_3_fg;
        hover_bg_vrnt_1 = accent_4_bg;
        hover_fg_vrnt_1 = accent_4_fg;
        hover_bg_vrnt_2 = accent_4_bg;
        hover_fg_vrnt_2 = accent_4_fg;

        ########################################################################
        # statuses

        # error
        error = {
          color_light = vars.red;
          color_dark  = vars.red;
        };
        error_bg = {
          color_light = "#ffcccc"; # 0  , 20 , 100
          color_dark  = "#ffcccc";
        };
        error_fg = {
          color_light = "#cc0000"; # 0  , 100, 80
          color_dark  = "#cc0000";
        };

        # warning
        warning = {
          color_light = vars.orange_xxdeep;
          color_dark  = vars.orange_deep;
        };
        warning_bg = {
          color_light = "#ffeecc"; # 40 , 20 , 100
          color_dark  = "#ffeecc";
        };
        warning_fg = {
          color_light = "#bd6800"; # 33 , 100, 74
          color_dark  = "#bd6800";
        };

        # success
        success = {
          color_light = vars.green_deep_xdark;
          color_dark  = vars.green;
        };
        success_bg = {
          color_light = "#e8ffcc"; # 87 , 20 , 100
          color_dark  = "#e8ffcc";
        };
        success_fg = {
          color_light = "#4c8a00"; # 87 , 100, 54
          color_dark  = "#4c8a00";
        };

        # info
        info = {
          color_light = vars.blue_deep_dark;
          color_dark  = vars.blue_light;
        };
        info_bg = secondary_bg;
        info_fg = secondary_fg;

        ########################################################################
        # syntax highlighting

        # code syntax
        code_class = {
          color_light = vars.orange_xdeep;
          color_dark  = vars.orange;
        };
        code_comment = {
          color_light = vars.green_deep_xdark;
          color_dark  = vars.green_deep_light;
        };
        code_constant = {
          color_light = vars.blue_deep;
          color_dark  = vars.blue_light;
        };
        code_function = {
          color_light = vars.orange_xdeep;
          color_dark  = vars.orange;
        };
        code_keyword = {
          color_light = vars.pink_xxlight;
          color_dark  = vars.pink_xxxxlight;
        };
        code_variable = default_fg;

        code_match_paren_bg = {
          color_light = vars.green_deep_xlight;
          color_dark  = vars.green_deep_xlight;
        };
        code_match_paren_fg = search_curr_fg;

        # markdown syntax
        md_bold = {
          color_light = vars.pink_xxlight;
          color_dark  = vars.pink_xxxlight;
        };
        md_italic = md_bold;
        md_title = {
          color_light = vars.pink_light;
          color_dark  = vars.pink_xxlight;
        };
        md_code = {
          color_light = vars.pink_light;
          color_dark  = vars.pink_xxlight;
        };

        ########################################################################
        # other

        # search/find
        search_bg = selection_bg;
        search_fg = selection_fg;
        search_curr_bg = {
          color_light = vars.green_deep_light;
          color_dark  = vars.green_deep_light;
        };
        search_curr_fg = {
          color_light = vars.gray_dark;
          color_dark  = vars.black;
        };

        # links
        link = {
          color_light = vars.pink_xlight;
          color_dark  = vars.green_light;
        };
        link_hover = {
          color_light = vars.pink_light;
          color_dark  = vars.green_xlight;
        };
        link_disabled = {
          color_light = vars.pink_xxxlight;
          color_dark  = vars.green_deep_xdark;
        };
        link_visited = link_hover;

        ########################################################################
        # button-like elements

        btn_flat_border      = accent_4_border;
        btn_flat_hover_bg    = accent_4_bg;
        btn_flat_hover_fg    = accent_4_fg;
        btn_raised_border    = accent_3_border;
        btn_raised_base_bg   = accent_3_bg;
        btn_raised_base_fg   = accent_3_fg;
        btn_xraised_border   = accent_2_border;
        btn_xraised_base_bg  = accent_2_bg;
        btn_xraised_base_fg  = accent_2_fg;
        btn_selected_border  = btn_xraised_border;
        btn_selected_base_bg = btn_xraised_base_bg;
        btn_selected_base_fg = btn_xraised_base_fg;

        # button-like elements on variant 1 surfaces
        btn_flat_border_vrnt_1      = accent_4_border_vrnt_1;
        btn_flat_hover_bg_vrnt_1    = accent_4_bg;
        btn_flat_hover_fg_vrnt_1    = accent_4_fg;
        btn_raised_border_vrnt_1    = accent_4_border_vrnt_1;
        btn_raised_base_bg_vrnt_1   = accent_4_bg;
        btn_raised_base_fg_vrnt_1   = accent_4_fg;
        btn_xraised_border_vrnt_1   = accent_3_border_vrnt_1;
        btn_xraised_base_bg_vrnt_1  = accent_3_bg;
        btn_xraised_base_fg_vrnt_1  = accent_3_fg;
        btn_selected_border_vrnt_1  = btn_xraised_border_vrnt_1;
        btn_selected_base_bg_vrnt_1 = btn_xraised_base_bg_vrnt_1;
        btn_selected_base_fg_vrnt_1 = btn_xraised_base_fg_vrnt_1;

        # button-like elements on variant 2 surfaces
        btn_flat_border_vrnt_2      = accent_4_border_vrnt_2;
        btn_flat_hover_bg_vrnt_2    = accent_4_bg;
        btn_flat_hover_fg_vrnt_2    = accent_4_fg;
        btn_raised_border_vrnt_2    = accent_4_border_vrnt_2;
        btn_raised_base_bg_vrnt_2   = accent_4_bg;
        btn_raised_base_fg_vrnt_2   = accent_4_fg;
        btn_xraised_border_vrnt_2   = accent_3_border_vrnt_2;
        btn_xraised_base_bg_vrnt_2  = accent_3_bg;
        btn_xraised_base_fg_vrnt_2  = accent_3_fg;
        btn_selected_border_vrnt_2  = btn_xraised_border_vrnt_2;
        btn_selected_base_bg_vrnt_2 = btn_xraised_base_bg_vrnt_2;
        btn_selected_base_fg_vrnt_2 = btn_xraised_base_fg_vrnt_2;

        # button-like elements on selected surfaces
        btn_flat_border_slct      = border_2;
        btn_raised_border_slct    = border_1;
        btn_raised_base_bg_slct   = btn_xraised_base_bg;
        btn_raised_base_fg_slct   = btn_xraised_base_fg;
      };
    };
  };
}
