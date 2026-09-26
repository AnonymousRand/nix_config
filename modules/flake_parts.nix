{ inputs, ... }: {
  flake-file.inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  # note that the systems to feed to flake-parts' `perSystem` i think is set as `den.systems`
  # when using den; and this should by default collect all the systems of all hosts & homes
  #systems = [
  #  "x86_64-linux"
  #  "aarch64-linux"
  #];
}
