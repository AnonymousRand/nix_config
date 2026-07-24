{
  flake.modules.nixos.vim = {
    programs.vim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
