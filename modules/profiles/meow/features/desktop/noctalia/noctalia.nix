{ den, ... }: {
  den.aspects.profiles.meow = {
    homeManager = { syst, config, lib, ... }: {
      xdg.configFile."noctalia/wallpapers" = {
        source = ./dotfiles/wallpapers;
        recursive = true; # just for convenience
      };

      programs.noctalia = {
        settings = {
          ######################################################################
          # general appearance

          theme = {
            mode = "auto";
            templates = {
              enable_builtin_templates = true;
            };
          };

          wallpaper = {
            enabled = true;
            # (note that `directory` only seems to be for automation/randomizer;
            # otherwise, set `default.path`)
            directory = "${config.xdg.configHome}/noctalia/wallpapers/";
            fill_mode = "fit";
            transition = [ "fade" ];
            transition_duration = 2500;
            transition_on_startup = true;

            automation = {
              enabled = true;
              interval_seconds = 1800;
              order = "random";
              recursive = false;
            };
          };

          lockscreen = {
            enabled = true;
            # (don't use blurred version of current desktop's contents as wallpaper/background)
            blurred_desktop = false;
            blur_intensity = 0;
            tint_intensity = 0;
            # (empty uses desktop wallpaper)
            wallpaper = "";
          };

          lockscreen_widgets.widget = lib.mapAttrs' (outputName: _:
            lib.nameValuePair ("lockscreen-login-box@${outputName}") {
              settings = {
                # why are these enabled by default? does anyone actually want these?? >w<
                show_media = false;
                show_weather = false;
              };
            }
          ) syst.settings.capabilities.graphics.displayOutputs;

          ######################################################################
          # bar & widgets

          bar.default = {
            start = [
              "launcher"
              "workspaces"
            ];
            center = [
              "noctalia/bongocat:cat"
              "clock"
            ];
            end = [
              "tray"
              "bluetooth"
              "network"
              "volume"
              "battery"
              "settings"
              "control-center"
              "notifications"
              "session"
            ];
          };

          widget = {
            clock = {
              format = ''
                {:%Y/%m/%d}     ₊˚⊹ ᓚ₍⑅^..^₎♡      {:%H:%M}      ♡ ⊹˚₊ ₍^. .^₎⟆      {:%A} :3
              '';
            };

            tray = {
              drawer = true;
              pinned = [
                "fcitx5"
              ];
            };
          };

          ######################################################################
          # keybinds (in noctalia panels)

          keybinds = {
            validate     = [ "return" "kp_enter" ];
            cancel       = [ "escape" ];
            left         = [ "ctrl+shift+h" "left" ];
            down         = [ "ctrl+shift+j" "down" ];
            up           = [ "ctrl+shift+k" "up" ];
            right        = [ "ctrl+shift+l" "right" ];
            tab_next     = [ "tab" ];
            tab_previous = [ "shift+tab" "iso_left_tab" ];
            copy         = [ "ctrl+c" ];
            save         = [ "ctrl+s" ];
            delete       = [ "del" ];
          };

          # TODO: to get hotkey to use/copy current item on clipboard panel, try writing a script
          # (possibly bound to a key in niri?) that when clipboard panel is active, performs the
          # action tab>tab>enter which should click the copy button when focus is on the clipboard
          # history list/typing in the search bar)

          ######################################################################
          # misc

          shell = {
            polkit_agent = true;
            show_location = false;
          };

          # this sets precise times for light/dark mode switching
          location = {
            auto_locate = false;
            custom_schedule = true;
            sunrise = "09:00";
            sunset = "18:00";
          };
        };
      };
    };
  };
}
