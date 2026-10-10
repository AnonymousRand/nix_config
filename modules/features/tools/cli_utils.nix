{
  den.aspects.features.tools.cli-utils = { pkgs, ... }:
    let
      packages = [
        pkgs.curl
        pkgs.file
        pkgs.findutils
        pkgs.inotify-tools
        pkgs.rename
        pkgs.tree
        pkgs.unzip
        pkgs.util-linux
        pkgs.wget
      ];
    in
    {
      nixos = {
        environment.systemPackages = packages;
      };

      # this ensures that they are also installed with standalone home manager
      homeManager = {
        home.packages = packages;
      };
    };
}
