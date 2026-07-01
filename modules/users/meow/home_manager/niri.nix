{ inputs, ... }: {
  flake.homeModules.meow = { config, pkgs, ... }: {
    imports = [
      inputs.niri.homeModules.niri
    ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
      config = builtins.readFile ./dotfiles/niri_config.kdl;
    };
  };
}
