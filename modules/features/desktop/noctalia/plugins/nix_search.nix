{ den, ... }: {
  den.aspects.features.desktop.noctalia.plugins.nix-search = {
    includes = [
      den.aspects.features.tools.fzf
      den.aspects.features.tools.nix-search-tv
    ];

    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.noctalia.settings = {
          plugins.enabled = [
            "knyrps/nix-search"
          ];
        };
      };
  };
}
