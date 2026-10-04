{
  den.aspects.profiles.meow = {
    homeManager = { config, ... }:
      let
        noctaliaThemeCfgPath = "niri/noctalia_theme.kdl";
        cfgFiles = builtins.filter
          (filename: filename != "noctalia_theme.kdl")
          (builtins.attrNames (builtins.readDir ./dotfiles));
      in
      {
        wayland.windowManager.niri = {
          settings = {
            # put everything in `_children` so i don't have to worry about duplicate keys
            # and get to group config sections as i wish
            _children = [
              ##################################################################
              # basics

              # spawn noctalia and fcitx5 daemon on startup
              { spawn-at-startup = [ "noctalia" ]; }
              { spawn-at-startup = [ "fcitx5" "-d" ]; }

              # path is formatted with `strftime`
              { screenshot-path = "~/pictures/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png"; }

              # turn off middle click clipboard
              {
                clipboard = {
                  disable-primary = {};
                };
              }

              ##################################################################
              # input

              {
                input = {
                  keyboard = {
                    # use default keyboard settings provided by host's nix config
                    xkb = {};
                    # enable numlock on startup
                    numlock = {};
                  };

                  mouse = {
                    # turn of "dynamic mouse acceleration"
                    accel-profile = "flat";
                  };

                  touchpad = {
                    tap = {};
                    natural-scroll = {};
                    accel-profile = "flat";
                    scroll-method = "two-finger";
                  };
                };
              }

              ##################################################################
              # layout

              {
                layout = {
                  gaps = 0;
                  center-focused-column = "never";

                  preset-column-widths._children = [
                    { proportion = 0.33333; }
                    { proportion = 0.5; }
                    { proportion = 0.66667; }
                    { proportion = 1.0; }
                  ];

                  preset-window-heights._children = [
                    { proportion = 0.33333; }
                    { proportion = 0.5; }
                    { proportion = 0.66667; }
                    { proportion = 1.0; }
                  ];

                  default-column-width = {
                    proportion = 0.5;
                  };

                  focus-ring = {
                    on = {};
                    width = 5;
                  };

                  # normally you don't want both the focus ring and border active at the same time,
                  # but my current setup does both so there's still a border when inactive, but a
                  # stronger focus ring when active (and the active border and focus ring should
                  # have the same colors, so as to make a thicker focus ring and look prettier :3)
                  border = {
                    on = {};
                    width = 2;
                  };

                  shadow = {
                    off = {};
                    draw-behind-window = false;
                    softness = 30;
                    spread = 5;
                    offset._props = { x = 0; y = 5; };
                  };

                  struts = {
                    # this is to make the focus ring not clip at the edges of the screen
                    # (since `gaps 0` is set to not leave gaps between adjacent borders),
                    # and should be equal to the focus ring's width
                    left = 5;
                    right = 5;
                    top = 5;
                    bottom = 5;
                  };

                  # tab indicator when multiple windows in a column are in tabbed view
                  tab-indicator = {
                    on = {};
                    gap = 14;
                    width = 8;
                    corner-radius = 4;
                  };
                };
              }

              {
                # uncomment to ask apps to turn off client-side decorations
                # this is an alternative to `draw-behind-window` for shadows, focus rings, and borders
                # that is better if you want translucent windows
                prefer-no-csd = {};
              }

              {
                window-rule._children = [
                  { draw-border-with-background = false; }
                ];
              }

              ##################################################################
              # windows

              {
                window-rule._children = [
                  { match._props = { app-id = "com.mitchellh.ghostty"; }; }
                  { opacity = 0.96; }
                ];
              }

              # make fcitx5 input candidate popup not be a tiled window
              {
                window-rule._children = [
                  { match._props = { app-id = "fcitx"; title = "^Fcitx5 Input Window"; }; }
                  { open-floating = true; }
                ];
              }

              # make these noctalia surfaces also translucent
              {
                layer-rule._children = [
                  {
                    match._props = {
                      namespace =
                        "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";
                    };
                  }
                  { opacity = 0.925; }
                  { background-effect.blur = false; }
                ];
              }

              # turn on drop shadows for floating windows
              {
                window-rule._children = [
                  { match._props = { is-floating = true; }; }
                  { shadow.on = {}; }
                ];
              }

              # enable rounded corners for all windows
              {
                window-rule._children = [
                  { geometry-corner-radius = 12; }
                  { clip-to-geometry = true; }
                ];
              }

              # open these windows as floating by default:
              #     - firefox picture-in-picture video player
              {
                window-rule._children = [
                  # this `app-id` regex should work for both:
                  #     - host firefox (`app-id` is "firefox")
                  #     - flatpak firefox (`app-id` is "org.mozilla.firefox")
                  {
                    match._props = {
                      app-id._raw = ''r#"firefox$"#'';
                      title = "^Picture-in-Picture$";
                    };
                  }
                  { open-floating = true; }
                ];
              }

              # work around wezterm's initial configure bug by setting empty `default-column-width`
              {
                window-rule._children = [
                  { match._props = { app-id._raw = ''r#"^org\.wezfurlong\.wezterm$"#''; }; }
                  { default-column-width = {}; }
                ];
              }

              ##################################################################
              # binds

              {
                # disable "important hotkeys" popup at startup
                hotkey-overlay = {
                  skip-at-startup = {};
                };
              }

              {
                binds = {
                  # basics
                  "Super+Alt+Slash" = {
                    _props.hotkey-overlay-title = "show hotkeys";
                    show-hotkey-overlay = {};
                  };
                  "Super+Alt+P" = {
                    _props.hotkey-overlay-title = "screen off";
                    power-off-monitors = {};
                  };
                  "Super+Alt+L" = {
                    _props.hotkey-overlay-title = "lock";
                    spawn-sh = "noctalia msg session lock";
                  };
                  "Super+Alt+S" = {
                    _props.hotkey-overlay-title = "sleep";
                    spawn-sh = "noctalia msg session lock-and-suspend";
                  };
                  "Super+Alt+Q" = {
                    _props.hotkey-overlay-title = "close window";
                    _props.repeat = false;
                    close-window = {};
                  };
                  "Super+Alt+Ctrl+Shift+E" = {
                    _props.hotkey-overlay-title = "exit niri";
                    quit = {};
                  };
                  "Super+Alt+Ctrl+Shift+Q" = {
                    _props.hotkey-overlay-title = "shutdown";
                    spawn-sh = "noctalia msg session shutdown";
                  };

                  "Super+Alt+D" = {
                    _props.hotkey-overlay-title = "launcher";
                    spawn-sh = "noctalia msg panel-toggle launcher";
                  };
                  "Super+Alt+F" = {
                    _props.hotkey-overlay-title = "file search";
                    spawn-sh = "noctalia msg panel-toggle nightwatch75/file-search:panel";
                  };
                  "Super+Alt+I" = {
                    _props.hotkey-overlay-title = "settings";
                    spawn-sh = "noctalia msg settings-toggle";
                  };
                  "Super+Alt+T" = {
                    _props.hotkey-overlay-title = "terminal (ghostty)";
                    spawn = [ "ghostty" ];
                  };
                  "Super+Alt+E" = {
                    _props.hotkey-overlay-title = "files (nautilus)";
                    spawn = [ "nautilus" ];
                  };
                  "Super+Alt+C" = {
                    _props.hotkey-overlay-title = "color picker";
                    spawn-sh = "hyprpicker --autocopy";
                  };
                  "Super+Alt+V" = {
                    _props.hotkey-overlay-title = "clipboard";
                    spawn-sh = "noctalia msg panel-toggle clipboard";
                  };

                  "Mod+Print" = {
                    _props.hotkey-overlay-title = "screenshot screen";
                    screenshot-screen = {};
                  };
                  # (note: ctrl+c within this interactive screenshot UI copies to clipboard
                  # without saving to disk)
                  # hide mouse pointer by default in interactive screenshot UI
                  "Mod+Shift+Print" = {
                    _props.hotkey-overlay-title = "screenshot (interactive)";
                    screenshot._props = { show-pointer = false; };
                  };
                  # show mouse pointer in window screenshot only if pointer is on top of window
                  "Mod+Ctrl+Print" = {
                    _props.hotkey-overlay-title = "screenshot window";
                    screenshot-window._props = { show-pointer = true; };
                  };
                  "Mod+Shift+S" = {
                    _props.hotkey-overlay-title = "screenshot (annotated)";
                    spawn-sh = ''
                      bash \"${config.xdg.configHome}/niri/scripts/annotated_screenshot.sh\" \
                        --show-pointer=false
                    '';
                  };
                  "Mod+Shift+T" = {
                    _props.hotkey-overlay-title = "screenshot (OCR)";
                    spawn-sh = ''
                      bash \"${config.xdg.configHome}/niri/scripts/ocr.sh\" \
                        --show-pointer=false
                    '';
                  };

                  # layout
                  "Mod+grave" = {
                    _props.repeat = false;
                    _props.hotkey-overlay-title = "toggle overview";
                    toggle-overview = {};
                  };
                  "Mod+H" = {
                    _props.hotkey-overlay-title = null;
                    focus-column-left = {};
                  };
                  "Mod+J" = {
                    _props.hotkey-overlay-title = null;
                    focus-window-down = {};
                  };
                  "Mod+K" = {
                    _props.hotkey-overlay-title = null;
                    focus-window-up = {};
                  };
                  "Mod+L" = {
                    _props.hotkey-overlay-title = null;
                    focus-column-right = {};
                  };

                  "Mod+Ctrl+H" = {
                    _props.hotkey-overlay-title = null;
                    move-column-left = {};
                  };
                  "Mod+Ctrl+J" = {
                    _props.hotkey-overlay-title = null;
                    move-window-down = {};
                  };
                  "Mod+Ctrl+K" = {
                    _props.hotkey-overlay-title = null;
                    move-window-up = {};
                  };
                  "Mod+Ctrl+L" = {
                    _props.hotkey-overlay-title = null;
                    move-column-right = {};
                  };

                  "Mod+Ctrl+I" = {
                    _props.hotkey-overlay-title = null;
                    move-column-to-workspace-down = {};
                  };
                  "Mod+Ctrl+O" = {
                    _props.hotkey-overlay-title = null;
                    move-column-to-workspace-up = {};
                  };
                  "Mod+Ctrl+Page_Down" = { move-window-to-workspace-down = {}; };
                  "Mod+Ctrl+Page_Up"   = { move-window-to-workspace-up = {}; };

                  "Mod+Ctrl+Shift+H"     = { move-column-to-monitor-left = {}; };
                  "Mod+Ctrl+Shift+J"     = { move-column-to-monitor-down = {}; };
                  "Mod+Ctrl+Shift+K"     = { move-column-to-monitor-up = {}; };
                  "Mod+Ctrl+Shift+L"     = { move-column-to-monitor-right = {}; };
                  "Mod+Ctrl+Shift+Left"  = { move-window-to-monitor-left = {}; };
                  "Mod+Ctrl+Shift+Down"  = { move-window-to-monitor-down = {}; };
                  "Mod+Ctrl+Shift+Up"    = { move-window-to-monitor-up = {}; };
                  "Mod+Ctrl+Shift+Right" = { move-window-to-monitor-right = {}; };

                  "Mod+Home"      = { focus-column-first = {}; };
                  "Mod+End"       = { focus-column-last = {}; };
                  "Mod+Ctrl+Home" = { move-column-to-first = {}; };
                  "Mod+Ctrl+End"  = { move-column-to-last = {}; };

                  "Mod+I" = {
                    _props.hotkey-overlay-title = null;
                    focus-workspace-down = {};
                  };
                  "Mod+O" = {
                    _props.hotkey-overlay-title = null;
                    focus-workspace-up = {};
                  };

                  "Mod+Shift+I" = { move-workspace-down = {}; };
                  "Mod+Shift+O" = { move-workspace-up = {}; };

                  "Mod+Ctrl+Shift+U" = { move-workspace-to-monitor-left = {}; };
                  "Mod+Ctrl+Shift+I" = { move-workspace-to-monitor-down = {}; };
                  "Mod+Ctrl+Shift+O" = { move-workspace-to-monitor-up = {}; };
                  "Mod+Ctrl+Shift+P" = { move-workspace-to-monitor-right = {}; };

                  "Mod+Shift+H" = { focus-monitor-left = {}; };
                  "Mod+Shift+J" = { focus-monitor-down = {}; };
                  "Mod+Shift+K" = { focus-monitor-up = {}; };
                  "Mod+Shift+L" = { focus-monitor-right = {}; };

                  "Mod+WheelScrollDown" = {
                    _props.cooldown-ms = 150;
                    focus-workspace-down = {};
                  };
                  "Mod+WheelScrollUp" = {
                    _props.cooldown-ms = 150;
                    focus-workspace-up = {};
                  };
                  "Mod+Ctrl+WheelScrollDown" = {
                    _props.cooldown-ms = 150;
                    move-column-to-workspace-down = {};
                  };
                  "Mod+Ctrl+WheelScrollUp" = {
                    _props.cooldown-ms = 150;
                    move-column-to-workspace-up = {};
                  };

                  "Mod+WheelScrollRight"      = { focus-column-right = {}; };
                  "Mod+WheelScrollLeft"       = { focus-column-left = {}; };
                  "Mod+Ctrl+WheelScrollRight" = { move-column-right = {}; };
                  "Mod+Ctrl+WheelScrollLeft"  = { move-column-left = {}; };

                  "Mod+Shift+WheelScrollDown"      = { focus-column-right = {}; };
                  "Mod+Shift+WheelScrollUp"        = { focus-column-left = {}; };
                  "Mod+Ctrl+Shift+WheelScrollDown" = { move-column-right = {}; };
                  "Mod+Ctrl+Shift+WheelScrollUp"   = { move-column-left = {}; };

                  "Mod+1" = { focus-workspace = 1; };
                  "Mod+2" = { focus-workspace = 2; };
                  "Mod+3" = { focus-workspace = 3; };
                  "Mod+4" = { focus-workspace = 4; };
                  "Mod+5" = { focus-workspace = 5; };
                  "Mod+6" = { focus-workspace = 6; };
                  "Mod+7" = { focus-workspace = 7; };
                  "Mod+8" = { focus-workspace = 8; };
                  "Mod+9" = { focus-workspace = 9; };

                  "Mod+Ctrl+1" = { move-column-to-workspace = 1; };
                  "Mod+Ctrl+2" = { move-column-to-workspace = 2; };
                  "Mod+Ctrl+3" = { move-column-to-workspace = 3; };
                  "Mod+Ctrl+4" = { move-column-to-workspace = 4; };
                  "Mod+Ctrl+5" = { move-column-to-workspace = 5; };
                  "Mod+Ctrl+6" = { move-column-to-workspace = 6; };
                  "Mod+Ctrl+7" = { move-column-to-workspace = 7; };
                  "Mod+Ctrl+8" = { move-column-to-workspace = 8; };
                  "Mod+Ctrl+9" = { move-column-to-workspace = 9; };

                  "Mod+Ctrl+Shift+1" = { move-window-to-workspace = 1; };
                  "Mod+Ctrl+Shift+2" = { move-window-to-workspace = 2; };
                  "Mod+Ctrl+Shift+3" = { move-window-to-workspace = 3; };
                  "Mod+Ctrl+Shift+4" = { move-window-to-workspace = 4; };
                  "Mod+Ctrl+Shift+5" = { move-window-to-workspace = 5; };
                  "Mod+Ctrl+Shift+6" = { move-window-to-workspace = 6; };
                  "Mod+Ctrl+Shift+7" = { move-window-to-workspace = 7; };
                  "Mod+Ctrl+Shift+8" = { move-window-to-workspace = 8; };
                  "Mod+Ctrl+Shift+9" = { move-window-to-workspace = 9; };

                  "Mod+Tab" = { focus-workspace-previous = {}; };

                  "Mod+BracketLeft" = {
                    _props.hotkey-overlay-title = null;
                    consume-or-expel-window-left = {};
                  };
                  "Mod+BracketRight" = {
                    _props.hotkey-overlay-title = null;
                    consume-or-expel-window-right = {};
                  };
                  "Mod+Comma" = {
                    _props.hotkey-overlay-title = null;
                    consume-window-into-column = {};
                  };
                  "Mod+Period" = {
                    _props.hotkey-overlay-title = null;
                    expel-window-from-column = {};
                  };

                  "Mod+R" = {
                    _props.hotkey-overlay-title = null;
                    switch-preset-column-width = {};
                  };
                  "Mod+Shift+R"      = { switch-preset-column-width-back = {}; };
                  "Mod+Ctrl+R"       = { switch-preset-column-height = {}; };
                  "Mod+Ctrl+Shift+R" = { switch-preset-column-height-back = {}; };

                  "Mod+M" = {
                    _props.hotkey-overlay-title = null;
                    maximize-column = {};
                  };
                  "Mod+F"      = { expand-column-to-available-width = {}; };
                  # this still has bar etc., unlike fullscreen
                  "Mod+Ctrl+M" = { maximize-window-to-edges = {}; };
                  "Mod+Ctrl+F" = { fullscreen-window = {}; };

                  "Mod+C"      = { center-column = {}; };
                  "Mod+Ctrl+C" = { center-visible-column = {}; };

                  "Mod+Minus"      = { set-column-width = "-5%"; };
                  "Mod+Equal"      = { set-column-width = "+5%"; };
                  # (there isn't a `reset-column-width` :( )
                  "Mod+0"          = { set-column-width = "50%"; };
                  "Mod+Ctrl+Minus" = { set-window-height = "-5%"; };
                  "Mod+Ctrl+Equal" = { set-window-height = "+5%"; };
                  "Mod+Ctrl+0"     = { reset-window-height = {}; };

                  "Mod+V" = {
                    _props.hotkey-overlay-title = null;
                    toggle-window-floating = {};
                  };
                  "Mod+Ctrl+V" = {
                    _props.hotkey-overlay-title = null;
                    switch-focus-between-floating-and-tiling = {};
                  };

                  "Mod+W" = { toggle-column-tabbed-display = {}; };

                  # hardware
                  "XF86AudioRaiseVolume" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+ -l 1.0";
                  };
                  "XF86AudioLowerVolume" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-";
                  };
                  "XF86AudioMute" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                  };
                  "XF86AudioMicMute" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                  };

                  "XF86AudioPlay" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl play-pause";
                  };
                  "Mod+F9" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl play-pause";
                  };
                  "XF86AudioPrev" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl previous";
                  };
                  "Mod+F10" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl position 5-";
                  };
                  "XF86AudioNext" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl next";
                  };
                  "Mod+F11" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl position 5+";
                  };
                  "XF86AudioStop" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl stop";
                  };
                  "Mod+F12" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "playerctl stop";
                  };

                  "XF86MonBrightnessUp" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "brightnessctl --class=backlight set +10%";
                  };
                  "XF86MonBrightnessDown" = {
                    _props.allow-when-locked = true;
                    spawn-sh = "brightnessctl --class=backlight set 10%-";
                  };

                  # other
                  # toggle whether applications (e.g. remote desktop) are allowed to inhibit/
                  # override niri's keybinds
                  "Mod+Escape" = {
                    _props.allow-inhibiting = false;
                    toggle-keyboard-shortcuts-inhibit = {};
                  };
                };
              }

              {
                gestures = {
                  # disable overview when mousing over top left corner
                  hot-corners = {
                    off = {};
                  };
                };
              }

              ##################################################################
              # recent windows switcher ("alt + tab")

              {
                recent-windows = {
                  debounce-ms = 750;
                  open-delay-ms = 150;

                  highlight = {
                    padding = 40;
                    corner-radius = 12;
                  };

                  previews = {
                    max-scale = 0.5;
                    max-height = 480;
                  };

                  binds = {
                    "Alt+Tab"       = { next-window = {}; };
                    "Alt+Shift+Tab" = { previous-window = {}; };
                    "Alt+grave" = {
                      next-window = {};
                      _props.scope = "workspace";
                    };
                    "Alt+Shift+grave" = {
                      previous-window = {};
                      _props.scope = "workspace";
                    };
                  };
                };
              }

              ##################################################################
              # backdrop (the background in overview mode)

              # place the regular noctalia wallpaper on the backdrop
              {
                layer-rule._children = [
                  { match._props = { namespace = "^noctalia-wallpaper"; }; }
                  { place-within-backdrop = true; }
                ];
              }

              # set transparent workspace background color so the backdrop is visible at all times
              {
                layout = {
                  background-color = "transparent";
                };
              }

              {
                overview = {
                  workspace-shadow.off = {};
                };
              }
            ];
          };

          extraConfig = ''
            include optional=true "${config.xdg.configHome}/${noctaliaThemeCfgPath}"
          '';

          #extraConfig =
          #  # (optional include to pass `niri validate` when home manager is building,
          #  # as then the `xdg.configFile` and noctalia templates might not exist yet)
          #  builtins.foldl' (acc: new:
          #    acc + "\ninclude optional=true \"${config.xdg.configHome}/niri/${new}\""
          #  ) "" cfgFiles
          #  + "\ninclude optional=true \"${config.xdg.configHome}/${noctaliaThemeCfgPath}\"";
        };

        ## we need to do this instead of a recursive `xdg.configFile` to specifically exclude
        ## the unrendered noctalia theme template file :(
        #xdg.configFile = builtins.listToAttrs (builtins.map (
        #  filename: {
        #    name = "niri/${filename}";
        #    value = { source = ./dotfiles/${filename}; };
        #  }
        #) cfgFiles);

        # noctalia theming
        aspects.batteries.noctalia-theming = {
          customColors = import ./_colors.nix;
          templates.niri = {
            input_path = builtins.toString ./dotfiles/noctalia_theme.kdl;
            output_path = "$XDG_CONFIG_HOME/${noctaliaThemeCfgPath}";
          };
        };
      };
  };
}
