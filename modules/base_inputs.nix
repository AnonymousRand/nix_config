{ inputs, ... }: {
  flake-file.inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
  };
}
