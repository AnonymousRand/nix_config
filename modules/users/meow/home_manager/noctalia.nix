{ inputs, ... }: {
  flake.homeModules.meow = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell {
      enable = true;
    };
  };
}
