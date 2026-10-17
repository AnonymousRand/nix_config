{
  den.profiles.meow = {
    settings.theme.colors = rec {
      ############################################################################
      # basic color variables
      # (avoid using these directly in templates as much as possible)

      vars = {
        # hsv of each color is indicated in comments, mostly using google color picker rounding
        blue              = "#00eaff"; # 185, 100, 100
        blue_light        = "#66f2ff"; # 185, 60 , 100
        blue_xlight       = "#80f4ff"; # 185, 50 , 100
        blue_xxlight      = "#bffaff"; # 185, 25 , 100
        blue_deep         = "#00d0ff"; # 191, 100, 100
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
        pink_xxxxxxlight = "#ffe3f1"; # 330, 11 , 100

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

      ############################################################################
      # custom color roles/variables (currently in format for noctalia custom colors)
      # (use these on things which have any of the following roles)

      roles = with vars; rec {
        # default bg/fg
        default_bg = {
          color_light = "#feedf3";
          color_dark  = black;
        };
        default_fg = {
          color_light = gray_dark;
          color_dark  = gray_xxlight;
        };
        lighter_fg = {
          color_light = gray_xlight;
          color_dark  = gray_light;
        };

        # variant bg/fg
        variant_1_bg = {
          color_light = "#fffafc"; # 336, 2  , 100
          color_dark  = gray_xxdark;
        };
        variant_1_fg = {
          color_light = pink_xxlight;
          color_dark  = pink_xxlight;
        };
        variant_2_bg = {
          color_light = white;
          color_dark  = gray_xdark;
        };
        variant_2_fg = {
          color_light = pink_xlight;
          color_dark  = pink_xxxlight;
        };

        # accents
        accent_1_bg = {
          color_light = pink_xxxlight;
          color_dark  = pink_xlight;
        };
        accent_1_fg = {
          color_light = pink;
          color_dark  = black;
        };
        accent_2_bg = {
          color_light = pink_xxxxlight;
          color_dark  = pink_xxlight;
        };
        accent_2_fg = {
          color_light = pink_light;
          color_dark  = gray_xxdark;
        };
        accent_3_bg = {
          color_light = pink_xxxxxlight;
          color_dark  = pink_xxxlight;
        };
        accent_3_fg = {
          color_light = pink_xlight;
          color_dark  = pink;
        };
        accent_4_bg = {
          color_light = pink_xxxxxxlight;
          color_dark  = pink_xxxxlight;
        };
        accent_4_fg = {
          color_light = pink_xxlight;
          color_dark  = pink_light;
        };
        accent_default_bg = accent_3_bg;
        accent_default_fg = accent_3_fg;

        accent_red_fg = {
          color_light = red;
          color_dark  = red;
        };
        accent_orange_fg = {
          color_light = orange_xdeep;
          color_dark  = orange_deep_light;
        };
        accent_yellow_fg = {
          color_light = orange_xdeep;
          color_dark  = orange_shallow;
        };
        accent_olive_fg = {
          color_light = green_deep_xdark;
          color_dark  = green_deep_dark;
        };
        accent_green_fg = {
          color_light = green_deep_dark;
          color_dark  = green_deep_light;
        };
        accent_teal_fg = {
          color_light = blue_deep;
          color_dark  = blue_xdeep;
        };
        accent_blue_fg = {
          color_light = blue;
          color_dark  = blue_light;
        };
        accent_violet_fg = {
          color_light = "#ff66f2";
          color_dark  = "#ff66f2";
        };
        accent_purple_fg = {
          color_light = purple;
          color_dark  = purple;
        };
        accent_pink_fg = {
          color_light = pink_xxxlight;
          color_dark  = pink_xxxlight;
        };
        accent_gold_fg = {
          color_light = orange_deep;
          color_dark  = orange_deep;
        };
        accent_brown_fg = {
          color_light = orange_xxdeep;
          color_dark  = orange_xxdeep;
        };
        accent_gray_fg = {
          color_light = gray_xdark;
          color_dark  = gray_xdark;
        };

        # borders
        border_1 = {
          color_light = pink_xlight;
          color_dark  = pink_light;
        };
        border_2 = {
          color_light = pink_xxlight;
          color_dark  = pink_xlight;
        };
        border_3 = {
          color_light = pink_xxxlight;
          color_dark  = pink_xxlight;
        };
        border_4 = {
          color_light = pink_xxxxlight;
          color_dark  = pink_xxxlight;
        };
        border_default = border_3;

        # selection
        selection_bg = {
          color_light = pink_xxxxxlight;
          color_dark  = pink_xxxxlight;
        };
        selection_fg = {
          color_light = pink_xlight;
          color_dark  = pink_light;
        };

        # cursor
        cursor_bg = {
          color_light = pink_xxxxlight;
          color_dark  = pink_xxxxlight;
        };
        cursor_fg = {
          color_light = pink_light;
          color_dark  = pink_light;
        };

        # hover
        hover_bg        = accent_3_bg;
        hover_fg        = accent_3_fg;
        hover_bg_vrnt_1 = accent_4_bg;
        hover_fg_vrnt_1 = accent_4_fg;
        hover_bg_vrnt_2 = accent_4_bg;
        hover_fg_vrnt_2 = accent_4_fg;

        # statuses
        error = {
          color_light = red;
          color_dark  = red;
        };
        error_bg = {
          color_light = "#ffcccc";
          color_dark  = "#ffcccc";
        };
        error_fg = {
          color_light = "#cc0000";
          color_dark  = "#cc0000";
        };

        warning = {
          color_light = orange_xxdeep;
          color_dark  = orange_deep;
        };
        warning_bg = {
          color_light = "#ffeecc";
          color_dark  = "#ffeecc";
        };
        warning_fg = {
          color_light = "#bd6800";
          color_dark  = "#bd6800";
        };

        success = {
          color_light = green_deep_xdark;
          color_dark  = green;
        };
        success_bg = {
          color_light = "#e8ffcc";
          color_dark  = "#e8ffcc";
        };
        success_fg = {
          color_light = "#4c8a00";
          color_dark  = "#4c8a00";
        };

        # search
        search_bg = selection_bg;
        search_fg = selection_fg;
        search_curr_bg = {
          color_light = green_deep_light;
          color_dark  = green_deep_light;
        };
        search_curr_fg = {
          color_light = default_fg.color_light;
          color_dark  = default_bg.color_dark;
        };

        # links
        link = {
          color_light = pink_xlight;
          color_dark  = green_light;
        };
        link_hover = {
          color_light = pink_light;
          color_dark  = green_xlight;
        };
        link_disabled = {
          color_light = pink_xxxlight;
          color_dark  = green_deep_xdark;
        };
        link_visited = link_hover;

        # code syntax
        code_class = {
          color_light = orange_xdeep;
          color_dark  = orange;
        };
        code_comment = {
          color_light = green_deep_xdark;
          color_dark  = green_deep_light;
        };
        code_constant = {
          color_light = blue_deep;
          color_dark  = blue_light;
        };
        code_function = {
          color_light = orange_xdeep;
          color_dark  = orange;
        };
        code_keyword = {
          color_light = pink_xxlight;
          color_dark  = pink_xxxxlight;
        };
        code_variable = default_fg;

        code_match_paren_bg = {
          color_light = green_deep_xlight;
          color_dark  = green_deep_xlight;
        };
        code_match_paren_fg = {
          color_light = default_fg.color_light;
          color_dark  = default_bg.color_dark;
        };

        # markdown syntax
        md_bold = {
          color_light = pink_xxlight;
          color_dark  = pink_xxxlight;
        };
        md_italic = md_bold;
        md_title = {
          color_light = pink_light;
          color_dark  = pink_xxlight;
        };
        md_code = {
          color_light = pink_light;
          color_dark  = pink_xxlight;
        };

        # button-like elements
        btn_flat_border      = border_3;
        btn_flat_hover_bg    = hover_bg;
        btn_flat_hover_fg    = hover_fg;
        btn_raised_border    = border_2;
        btn_raised_base_bg   = accent_3_bg;
        btn_raised_base_fg   = accent_3_fg;
        btn_xraised_border   = border_1;
        btn_xraised_base_bg  = accent_2_bg;
        btn_xraised_base_fg  = accent_2_fg;
        btn_selected_border  = btn_xraised_border;
        btn_selected_base_bg = btn_xraised_base_bg;
        btn_selected_base_fg = btn_xraised_base_fg;

        # button-like elements on variant 1 surfaces
        btn_flat_border_vrnt_1      = border_4;
        btn_flat_hover_bg_vrnt_1    = hover_bg_vrnt_1;
        btn_flat_hover_fg_vrnt_1    = hover_fg_vrnt_1;
        btn_raised_border_vrnt_1    = border_4;
        btn_raised_base_bg_vrnt_1   = accent_4_bg;
        btn_raised_base_fg_vrnt_1   = accent_4_fg;
        btn_xraised_border_vrnt_1   = border_3;
        btn_xraised_base_bg_vrnt_1  = accent_3_bg;
        btn_xraised_base_fg_vrnt_1  = accent_3_fg;
        btn_selected_border_vrnt_1  = btn_xraised_border_vrnt_1;
        btn_selected_base_bg_vrnt_1 = btn_xraised_base_bg_vrnt_1;
        btn_selected_base_fg_vrnt_1 = btn_xraised_base_fg_vrnt_1;

        # button-like elements on variant 2 surfaces
        btn_flat_border_vrnt_2      = border_4;
        btn_flat_hover_bg_vrnt_2    = hover_bg_vrnt_2;
        btn_flat_hover_fg_vrnt_2    = hover_fg_vrnt_2;
        btn_raised_border_vrnt_2    = border_4;
        btn_raised_base_bg_vrnt_2   = accent_4_bg;
        btn_raised_base_fg_vrnt_2   = accent_4_fg;
        btn_xraised_border_vrnt_2   = border_3;
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
