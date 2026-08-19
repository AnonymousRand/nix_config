import ../_cfg_all_profiles_for_user.nix {
  aspConfig.batteries.nix-ld = builtins.trace "sd" {
    libs = pkgs: [
      pkgs.uv
    ];
  };
}
