{ inputs, ... }: {
  flake.homeModules.meow = { config, pkgs, ... }: {
    imports = [
      inputs.niri.homeModules.niri
    ];

    programs.niri = {
      enable = true;
      config = builtins.readFile ./dotfiles/niri_config.kdl;
    };
  };
}
