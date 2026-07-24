{
  flake.modules.nixos.system-utils = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.curl
      pkgs.file
      pkgs.rename
      pkgs.tree
      pkgs.wget
    ];
  };
}
