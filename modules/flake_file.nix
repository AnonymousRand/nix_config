# base config for flake-file

{ inputs, ... }: {
  flake-file.inputs = {
    flake-file.url = "github:vic/flake-file";
  };

  imports = [
    # enables `flake-file.*` options, `write-flake`, etc.
    inputs.flake-file.flakeModules.default
  ];
}
