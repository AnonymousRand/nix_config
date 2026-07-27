{ inputs, ... }: {
  flake-file.inputs = {
    den.url = "github:denful/den";
  };

  imports = [
    # provides things like the top-level `den` argument
    inputs.den.flakeModule
  ];
}
