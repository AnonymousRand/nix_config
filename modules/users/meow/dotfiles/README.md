# Dotfiles

Put dotfiles (from `~/.config/`) that should be copied verbatim by Home Manager (using `builtins.readFile`, or `xdg.configFile`/`home.file` if that's not available like for vim colorscheme files) to `~/.config/` here. This is for configs that are rather annoying to state declaratively using Home Manager's native options. Try to mirror the directory structure as the real dotfiles as much as possible for ease of updating.

### Dotfile Config Methods

- Use Home Manager's native options if possible (and it's not too annoying).
- Otherwise, try using `builtins.readFile` from the dotfile in this directory into a Home Manager option (e.g. `programs.<program>.settings` or `programs.<program>.extraConfig`).
- Use `xfg.configFile` or `home.file` to copy the dotfile from this directory to the actual dotfile location as a last resort.
