# base config for flake-file

{ inputs, ... }: {
  imports = [
    inputs.flake-file.flakeModules.default
  ];

  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-file.url = "github:vic/flake-file";
    import-tree.url = "github:vic/import-tree";
  };
}
