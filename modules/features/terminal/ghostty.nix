{
  den.aspects.features.terminal.ghostty = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
      homeManager = {
        programs.ghostty.enable = true;
      };
    };
}
