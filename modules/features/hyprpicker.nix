{
  flake.modules.nixos.hyprpicker = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.hyprpicker
    ];
  };
}
