{
  meow.features.terminal.bash = {
    homeManager = {
      programs.bash = {
        shellAliases = {
          # allow aliases to work with `sudo` too
          "sudo" = "sudo ";
          # prompt for confirmation on destructive commands because i am stupid and foolish :3
          "rm" = "rm -i";
          "cp" = "cp -i";
          "mv" = "mv -i";
        };

        initExtra = ''
            # disable ctrl+s and ctrl+q for XON/XOFF (disabling/enabling terminal input)
            stty -ixon

            # tab cycles through autocomplete options and shift+tab does so backwards
            bind 'TAB:menu-complete'
            bind '"\e[Z": menu-complete-backward'
            # the first tab autocomplete only shows list of possible files (like default tab behavior)
            # while the second tab starts cycling through them
            bind 'set show-all-if-ambiguous on'
            bind 'set menu-complete-display-prefix on'

            # up and down cycles through history that matches what has already been typed on the line
            bind '"\e[A":history-search-backward'
            bind '"\e[B":history-search-forward'
        '';
      };
    };
  };
}
