{
  den.aspects.users.meow = {
    nixos = { pkgs, ... }: {
      utils.nix-ld = {
        libs = [
          pkgs.uv
        ];
      };
    };
  };
}
