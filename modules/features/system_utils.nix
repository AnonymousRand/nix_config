{
  den.aspects.system-utils = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.curl
        pkgs.file
        pkgs.rename
        pkgs.tree
        pkgs.wget
      ];
    };
  };
}
