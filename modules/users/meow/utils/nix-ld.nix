{
  den.aspects.users.meow = {
    nixos = { pkgs, ... }: {
      utils.${aspectName} = {
        libs = [
          pkgs.uv
        ];
      };
    };
  };
}
