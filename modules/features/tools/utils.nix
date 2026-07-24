{
  den.aspects.features.tools.utils = {
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
