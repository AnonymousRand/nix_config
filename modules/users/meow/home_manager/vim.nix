{
  flake.homeModules.meow = { config, pkgs, my, ... }: {
    programs.vim = {
      enable = true;
      plugins = [
        pkgs.vimPlugins.vim-sensible
        pkgs.vimPlugins.camelcasemotion
        pkgs.vimPlugins.vim-indentwise
      ];
      extraConfig = builtins.readFile (my.dotfiles + /vim/vimrc);
    };

    # Noctalia theme (custom colorscheme)
    # custom colorscheme
    programs.noctalia = {
      settings = {
        theme.templates.user.vim = {
          input_path = builtins.toString (my.dotfiles + /vim/colors/noctalia_theme.vim);
          output_path = "${config.home.homeDirectory}/.vim/colors/noctalia_theme.vim";
        };
      };
    };
  };
}
