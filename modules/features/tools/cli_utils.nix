{
  den.aspects.features.tools.cli-utils = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.curl
        pkgs.file
        pkgs.findutils
        pkgs.rename
        pkgs.tree
        pkgs.wget
      ];
    };
  };
}
