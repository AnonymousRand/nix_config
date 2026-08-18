{ meow, ... }:
let
  aspectName = "nix-ld";
in
{
  meow.aspects.utils.${aspectName} = { pkgs, ... }: {
    utils.${aspectName} = {
      libs = [
        pkgs.uv
      ];
    };
  };
}
