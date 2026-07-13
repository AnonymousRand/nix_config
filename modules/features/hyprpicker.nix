{
  flake.nixosModules.hyprpicker = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      hyprpicker
    ];
  };
}
