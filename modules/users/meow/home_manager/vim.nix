{
  flake.homeModules.meow = { pkgs, ... }: {
    programs.vim = {
      enable = true;
      plugins = [
        pkgs.vimPlugins.vim-sensible
        pkgs.vimPlugins.vim-camelcasemotion
        pkgs.vimPlugins.vim-indentwise
      ];
      extraConfig = builtins.readFile ../dotfiles/vim/vimrc
    };

    # custom colorscheme
    home.file.".vim/colors/anonymousrand.vim".source = ../dotfiles/vim/colors/anonymousrand.vim;
  };
}
