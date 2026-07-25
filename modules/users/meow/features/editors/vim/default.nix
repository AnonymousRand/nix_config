{ den, ... }: {
  meow.features.editors.vim = { user }: {
    includes = [
      den.aspects.features.editors.vim
    ];

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
      programs.noctalia = {
        settings.theme.templates.user.vim = {
          input_path = builtins.toString ./dotfiles/colors/noctalia_theme.vim;
          output_path = "${config.home.homeDirectory}/.vim/colors/noctalia_theme.vim";
        };
      };
    };
  };
}
