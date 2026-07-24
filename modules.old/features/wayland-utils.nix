{
  flake.modules.nixos.wayland-utils = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.hyprpicker   # color picker
      pkgs.wl-clipboard # wayland clipboard
    ];
  };
}
