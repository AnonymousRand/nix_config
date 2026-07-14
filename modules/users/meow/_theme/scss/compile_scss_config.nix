# currently this is just a regular derivation instead of being under something like `perSystem`,
# since `perSystem` kind of forces you to put your derivation into the top-level `perSystem.packages`
# as `callPackage` no longer works. however, this is a derivation specific to my user and is not
# meant to be globally distributed as a reusable, top-level package, so i want to avoid that. (i need
# to be more communist with my nix config.)
#
# also, this just uses the `pkgs`'s system as set by the `nixosConfiguration` or `homeConfiguration`,
# and those are not supposed to be under `perSystem` (e.g. i think you're supposed to define separate
# `homeConfiguration`s for each architecture that user is expected to be on). i think this means
# that everything should be fine if i ever need to move to a different architecture: e.g. for the
# case of `homeConfiguration`, i can just make a copy of my `homeConfiguration` but just set `pkgs`
# to a different architecture, and when this derivation is called it should just get that updated
# `pkgs` in its arguments and work just fine? >_<

{ dart-sass, stdenv }:

let
  # SCSS paths to be loaded with `sass --load-path` (for imports in other SCSS files
  # without needing relative paths). provide directories, not individual files
  scssPathsToLoad = [
    ./.
  ];
in stdenv.mkDerivation {
  pname = "compile-scss-config";
  version = "0.0.0";

  # input SCSS files to be copied into build environment
  srcs = scssPathsToLoad ++ [
    ../../features
  ];
  # don't try to unpack single files in `srcs` as archives
  dontUnpack = true;

  # build-time dependencies
  nativeBuildInputs = [
    dart-sass
  ];

  preBuild = ''
    find . -name '*.scss' -type f -exec sed -i 's/\({{ *\?colors\..\+\?}}\)/"\1"/g' {} +
  '';

  buildPhase = ''
    runHook preBuild

    mkdir build/
    sass ${../../features}:build/ --no-source-map \
        ${builtins.foldl' (acc: elem: acc + " --load-path ${elem}") "" scssPathsToLoad}
  '';

  installPhase = ''
    mkdir -p $out
    cp -r build/* $out/

    runHook postInstall
  '';

  postInstall = ''
    find . -name '*.css' -type f -exec sed -i 's/"\({{ *\?colors\..\+\?}}\)"/\1/g' {} +
  '';
}

  # build
  # 1. render base SCSS files as Noctalia templates (so SCSS syntax is correct)
  # 2. compile all SCSS files for all apps, and output the resulting CSS to
  #    the designated output directory for this derivation in the nix store ($out),
  #    which is accessible via `"${<this package>}/<desired file path>"` in home manager etc.
