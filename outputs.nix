inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
  imports = [
    ./flake_file.nix
    (inputs.import-tree ./modules)
  ];
}
