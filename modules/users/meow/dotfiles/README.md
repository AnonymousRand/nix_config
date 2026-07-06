# dotfiles

put dotfiles (from `~/.config/`) that should be copied verbatim by home manager (using `builtins.readFile`, or `xdg.configFile`/`home.file` if that's not available like for vim colorscheme files) to `~/.config/` here. this is for configs that are rather annoying to state declaratively using Home Manager's native options. try to mirror the directory structure as the real dotfiles as much as possible for ease of updating.

### dotfile config methods

- use home manager's native options if possible (and it's not too annoying or unsightly with a huge amount of raw string).
- otherwise, try using `builtins.readFile` from the dotfile in this directory into a home manager option (e.g. `programs.<program>.settings` or `programs.<program>.extraConfig`).
- use `xfg.configFile` or `home.file` to copy the dotfile from this directory to the actual dotfile location as a last resort.
