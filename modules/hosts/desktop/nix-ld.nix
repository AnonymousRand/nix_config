{
  den.hosts.x86_64-linux.desktop = {
    nixLdLibs = { pkgs, ... }: [
      pkgs.uv
    ];
  };
}
