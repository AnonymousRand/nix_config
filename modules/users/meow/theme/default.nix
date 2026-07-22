{
  flake.modules.homeManager.meow = { lib, ... }: {
    options.meow.theme = lib.mkOption {
      type = lib.types.attrs;
    };
  };
}
