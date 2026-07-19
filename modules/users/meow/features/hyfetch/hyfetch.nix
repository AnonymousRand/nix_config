{
  flake.homeModules.meow = { pkgs, ... }: {
    programs.hyfetch = {
      enable = true;
      # use my own custom wrapped `hyfetch` which allows different `lightness` settings per mode
      package = pkgs.callPackage ./lightness_per_mode_wrapper.nix {
        lightModeLightness = 0.85;
        darkModeLightness  = 0.58;
      };
    };

    xdg.configFile."hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
