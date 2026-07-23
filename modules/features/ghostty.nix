{ inputs, ... }: {
  flake-file.inputs = { 
    ghostty = {
      # this version is 2026/7/10; for fixed `adjust-cursor-height` bug
      url = "github:ghostty-org/ghostty/tip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.ghostty = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
