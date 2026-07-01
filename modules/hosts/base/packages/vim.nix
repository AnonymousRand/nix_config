{
  flake.nixosModules.base = {
    programs.vim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
