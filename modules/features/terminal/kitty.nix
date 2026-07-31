{
  den.aspects.features.terminal.kitty = { host, lib, ... }:
    lib.mkIf host.capabilities.graphics.supported {
      homeManager = {
        programs.kitty.enable = true;
      };
    };
}
