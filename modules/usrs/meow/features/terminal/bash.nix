{
  den.aspects.users.meow = {
    homeManager = {
      programs.bash = {
        shellAliases = {
          # allow aliases to work with `sudo` too
          "sudo" = "sudo ";
          # prompt for confirmation on destructive commands because i am stupid and foolish :3
          "rm" = "rm -i";
          "cp" = "cp -i";
          "mv" = "mv -i";
          # enable color support of basic commands
          "ls"    = "ls --color=auto";
          "dir"   = "dir --color=auto";
          "vdir"  = "vdir --color=auto";
          "grep"  = "grep --color=auto";
          "fgrep" = "fgrep --color=auto";
          "egrep" = "egrep --color=auto";
        };

        shellOptions = [
          "checkjobs"    # enable checking of background jobs
          "checkwinsize" # check and update window size after each command
          "extglob"      # extended globbing
          "histappend"   # append to history rather than overwrite it
          "globstar"     # enable `**` glob
        ];

        # number of commands to keep in memory
        historySize = 10000;
        # number of commands to keep in history file
        historyFileSize = 100000;

        # enable autocompletion on when tab key pressed
        enableCompletion = true;

        initExtra = ''
            # prompt styling, largely matching fish's (sorry i know this is an abomination)
            # (note: not putting it home manager's `sessionVariables` since that goes into
            # `~/.profile` and hence only works for login shells, i.e. `bash --login`)
            PS1="\n\[\e]0;\u@\h: \w\a\]\
            \[\033[1;95m\][\u\[\033[0m\]@\[\033[1;93m\]\h \
            \[\033[1;92m\]\w]\
            \[\033[95m\] ♡ ⊹˚₊ ₍^. .^₎Ⳋ\
            \n\[\033[35m\]₊\[\033[93m\]˚\[\033[32m\]₊\[\033[36m\]⊹\[\033[0m\]  "

            # disable ctrl+s and ctrl+q for XON/XOFF (disabling/enabling terminal input)
            stty -ixon

            # tab cycles through autocomplete options and shift+tab does so backwards
            # (note: setting these in readline doesn't seem to work; maybe gets overridden by bash?)
            bind 'TAB:menu-complete'
            bind '"\e[Z": menu-complete-backward'
            # the first tab input only shows list of possible files (like default tab behavior)
            # while the second tab input starts cycling through them
            bind 'set show-all-if-ambiguous on'
            bind 'set menu-complete-display-prefix on'
        '';
      };
    };
  };
}
