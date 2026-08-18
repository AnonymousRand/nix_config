{ meow, ... }:
let
  aspectName = "nix-ld";
in
{
  meow.aspects.utils.${aspectName} = {
    nixos = { pkgs, ... }: {
      utils.${aspectName} = {
        libs = [
          pkgs.uv
        ];
      };
    };
  };
}
