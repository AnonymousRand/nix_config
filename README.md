# Nix Config

uhhh

shoddy attempts at dendritic pattern with `flake-parts`

more documentation to come :3

## Structure

### NixOS Config

- NixOS configurations are defined in the `modules/hosts/<host name>/default.nix` files. Each host picks out features like packages, users, and shells by simply importing their `self.nixosModules` modules.
- As per the dendritic pattern, features like packages, users, and shells should be their own top-level `flake.nixosModules.<name>` NixOS modules and put into the folders `modules/packages/`, `modules/users/`, or `modules/shells/` respectively. (Note that since all of them are top-level modules and can be referenced directory from `self.nixosModules`, the actual location in which the files are placed mostly don't matter beyond organization/ease of development.)

### Home Manager Config

- Home Manager configurations are defined per user in `modules/users/<username>/`, and have versions for both standalone configs (built with `home-manager` command) and configs integrated into NixOS config (built with `nixos-rebuild`).
- In each `modules/users/<username>/default.nix`, both a `flake.homeModules.<name>` Home Manager module and a `flake.homeConfigurations.<name>` Home Manager configuration are defined. The Home Manager module is where all the config should go; the configuration simply imports the module. The configuration is the standalone version, while the module is integrated into the NixOS config of each host in `modules/hosts/<host name>/default.nix`.
- Package-specific config is put into `modules/users/<username>/home_manager/`, using the same Home Manager *module* name as the one in `modules/users/<username>/default.nix`. (Modules with the same name are merged by Nix.)
