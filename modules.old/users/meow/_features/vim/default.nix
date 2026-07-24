{ config, pkgs, ... }: {
  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.vim-sensible
      pkgs.vimPlugins.camelcasemotion
      pkgs.vimPlugins.vim-indentwise
      pkgs.vimPlugins.vim-oscyank
    ];
    extraConfig = builtins.readFile ./dotfiles/vimrc;
  };

  # Noctalia theme (custom colorscheme)
  # custom colorscheme
  programs.noctalia = {
    settings = {
      theme.templates.user.vim = {
        input_path = builtins.toString ./dotfiles/colors/noctalia_theme.vim;
        output_path = "${config.home.homeDirectory}/.vim/colors/noctalia_theme.vim";
      };
    };
  };
}
