{ inputs, ... }: {
  flake-file.inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  # systems to feed to flake-parts' `perSystem`
  # (i think this is how you do it in den...haven't really needed this yet though >w<)
  den.systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
