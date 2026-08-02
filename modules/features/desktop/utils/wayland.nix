{
  den.aspects.features.desktop.utils.wayland = { host ? null, home ? null }: {
    homeManager = { pkgs, ... }:
      import ../../_require_capabilities.nix { inherit host home; } [ "graphics" ] {
        home.packages = [
          pkgs.hyprpicker   # color picker
          pkgs.wl-clipboard # wayland clipboard
        ];
      };
  };
}
