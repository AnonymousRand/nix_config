{
  flake.nixosModules.base = {
    programs.git = {
      enable = true;
    };
  };
}
