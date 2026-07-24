# `/modules/users/`

users, along with both their nixos and home manager configs.

## how to manage lower-level user-specific configs/modules?

these are modules like feature modules for a specific user containing their specific configurations (example: the modules under `./meow/_features/`), and hence they should probably not be put directly into the global, top-level `flake.modules` namespace. currently using option 1, future me please dont change your mind thx love you bai :3

### option 1

make them regular nixos modules and import using relative paths in `flake.modules.homeManager.alice`.

advantages:
- by far the cleanest separation between top-level, reusable modules and lower-level, private modules

disadvantages:
- have to exclude regular modules from `import-tree` imports, but may then need to re-enable some of them/manually import some of them to catch things like the `colors.nix` files in the case of the user `meow`
- have to pass `inputs` through `extraSpecialArgs` in two places for some lower-level modules that need it, since we no longer obtain it automatically through being a flake-parts module (and `_module.args` doesn't work; infinite recursion)
- relies on fixed relative paths of lower-level modules when importing

### option 2

make them top-level modules but prefix them with `alice-`, like `flake.modules.homeManager.alice-feature1`.

advantages:
- no longer relies on fixed relative paths of imports since they are all top-level modules
- no longer have to worry about `import-tree` or `inputs` since everything is a flake-parts module

disadvantages:
- feels hacky, an inelegant way to get a purely semantic separation between top-level and lower-level modules

### option :3

make them all just contribute to the top-level `flake.modules.homeManager.alice` flake.

advantages:
- no imports needed at all beyond what `import-tree` automatically gives you, so most convenient for adding new lower-level modules
- also no longer have to worry about `import-tree` or `inputs` since everything is a flake-parts module

disadvantages:
- also feels kind of hacky
- removing modules is a bit harder, requiring us to prefix the filenames with an underscore so `import-tree` ignores them when importing
