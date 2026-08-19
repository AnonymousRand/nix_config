{
  den.aspects.users.meow = {
    homeManager = { config, pkgs, ... }: {
      programs.vim = {
        plugins = [
          pkgs.vimPlugins.vim-sensible
          pkgs.vimPlugins.camelcasemotion
          pkgs.vimPlugins.vim-indentwise
          pkgs.vimPlugins.vim-oscyank
        ];
        extraConfig = builtins.readFile ./dotfiles/vimrc;
      };

      # noctalia theming
      batteries.theme.noctalia-theming.templates.vim = {
        input_path = builtins.toString ./dotfiles/colors/noctalia_theme.vim;
        output_path = "${config.home.homeDirectory}/.vim/colors/noctalia_theme.vim";
      };
    };
  };
}
