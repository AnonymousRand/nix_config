{ inputs, ... }: {
  flake-file.inputs = {
    den.url = "github:denful/den";
  };

  imports = [
    # TODO test what happens if this is removed
    # absolutely no clue what this does but seems like it might be important
    inputs.den.flakeModule
    # TODO need to uncomment?
    ## define top-level `flake` output for den that works with flake-parts (idk thats what docs say)
    #inputs.den.flakeOutputs.flake
  ];
}
