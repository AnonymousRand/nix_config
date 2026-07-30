{
  den.aspects.features.fonts.maple-mono = { pkgs, ... }:
    let
      package = pkgs.maple-mono.NF;
    in
    {
      nixos = {
        environment.systemPackages = [
          package
        ];
      };

      homeManager = {
        home.packages = [
          package
        ];
      };
    };
}
