{
#{
  den.hosts.x86_64-linux.snow-rainbow.users.meow = builtins.trace "setting" {
    imports = [
      ({ pkgs, ... }: {
        aspConfig.batteries.nix-ld = builtins.trace "setting 2" [
          pkgs.uv
        ];
      })
    ];

    #settings.batteries.nix-ld.libs = builtins.trace "setting 3" [
    #  #pkgs.uv
    #];
  };
}
