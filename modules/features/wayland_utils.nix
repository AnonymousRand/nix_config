{
  den.aspects.wayland-utils = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.hyprpicker   # color picker
        pkgs.wl-clipboard # wayland clipboard
      ];
    };
  };
}
