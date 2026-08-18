{
  den.aspects.users.base = { lib, ... }: {
    imports = [
      {
        options.userSettings.theme.colors = lib.mkOption {
          type = lib.types.attrsOf lib.types.anything;
          default = {};
        };
      }
    ];
    userSettings.theme.colors.test = builtins.trace "hihi" 42;

    nixos = {
      programs.nh.enable = builtins.trace "hihi 2" false;
    };
  };
}
