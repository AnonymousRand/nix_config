{
  # passing `pkgs` at aspect level doesn't seem to work
  den.aspects.features.tools.cli-utils =
    let
      packages = pkgs: [
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
      nixos = { pkgs, ... }: {
        environment.systemPackages = packages pkgs;
      };

      # this ensures that they are also installed with standalone home manager
      homeManager = { pkgs, ... }: {
        home.packages = packages pkgs;
      };
    };
}
