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

  imports = [
    # allows `flake.modules.<class>.<aspect>` instead of `flake.<class>Modules.<aspect>`, which are
    # essentially regular modules which allow you to set "options" as simply attrset key-value pairs,
    # instead of needing to declare them in `options` and then set them in `config` like the latter.
    #
    # at the same time, they have the advantage over regular nix modules in that they are accessible
    # globally/as top-level modules via `self.modules.<class>.<aspect>`, instead of relying on
    # relative path imports like regular nix modules; so they're independent of directory structure.
    inputs.flake-parts.flakeModules.modules
    # allows using `perSystem.overlayAttrs` to add to `self.overlays.default`
    inputs.flake-parts.flakeModules.easyOverlay
  ];
}
