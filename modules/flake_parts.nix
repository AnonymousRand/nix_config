{ inputs, ... }: {
  flake-file.inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  # systems to feed to flake-parts' `perSystem`
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
