{ den, ... }: {
  den.aspects.features.desktop.noctalia.plugins.file-search = {
    includes = [
      den.aspects.features.desktop.xdg
      den.aspects.features.tools.cli-utils
      den.aspects.features.tools.fzf
      den.aspects.features.tools.glib
    ];

    homeManager = {
      programs.noctalia.settings = {
        plugins.enabled = [
          "nightwatch75/file-search"
        ];
      };
    };
  };
}
