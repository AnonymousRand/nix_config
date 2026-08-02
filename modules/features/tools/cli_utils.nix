{
  den.aspects.features.tools.cli-utils = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.curl
        pkgs.file
        pkgs.findutils
        pkgs.inotify-tools
        pkgs.rename
        pkgs.tree
        pkgs.util-linux
        pkgs.wget
      ];
    };
  };
}
