{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.noctalia-v4.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      settings = ../dotfiles/noctalia/settings.json;
    };
  };
}
