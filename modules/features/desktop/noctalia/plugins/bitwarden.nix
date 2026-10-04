{ den, ... }: {
  den.aspects.features.desktop.noctalia.plugins.bitwarden = {
    includes = [
      den.aspects.features.tools.bitwarden-cli
    ];

    homeManager = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        programs.noctalia.settings = {
          plugins.enabled = [
            "noctalia/bitwarden"
          ];
        };
      };
  };
}
