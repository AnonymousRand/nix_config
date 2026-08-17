{
  den.aspects.features.terminal.ghostty = { systSettings }: {
    homeManager = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ "graphics" ]) {
      programs.ghostty = {
        enable = true;
        # install vim plugin that provides syntax highlighting for ghostty config files
        installVimSyntax = true;
      };
    };
  };
}
