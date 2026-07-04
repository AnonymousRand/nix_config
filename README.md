# Nix Config

uhhh

a shoddy attempt at dendritic pattern with `flake-parts`

more documentation to come :3

## Structure

### so like what the heck is a dendritic pattern

- [Dendritic pattern](https://github.com/mightyiam/dendritic) (to the best of my little knowledge) is a way to organize Nix configs where we essentially organize our config by *feature,* such as packages or programs. Each feature gets a single top-level module, and hosts and users simply pick out the features they want by importing their top-level modules.
- This doesn't mean all files have to be top-level modules; a single top-level module can be broken up and spread across several files by using the same module name and letting Nix automatically merge them together (e.g. the top-level modules for each user in `modules/users/` is spread across all their Home Manager files).
- Dendritic pattern configs (including this one) often use [`flake-parts`](https://flake.parts) to help achieve this organization, which is like really confusing but it basically facilitates splitting up flakes and top-level modules into multiple files, and gives us flake-level options like `flake.nixosModules`. (These are exactly the "top-level modules" we give to each feature.)

### NixOS Config

- NixOS configurations are defined in the `modules/hosts/<host name>/default.nix` files. Each host picks out features like packages and users by simply importing their `self.nixosModules` modules.
- As per the dendritic pattern, features like packages and users should be their own top-level `flake.nixosModules.<name>` NixOS modules and put into the folders `modules/packages/` and `modules/users/` respectively. (Note that since all of them are top-level modules and can be referenced directory from `self.nixosModules`, the actual location in which the files are placed doesn't matter beyond organization/ease of development.)

### Home Manager Config

- Home Manager configurations are defined per user in `modules/users/<username>/`, and have versions for both standalone configs (built with `home-manager` command) and configs integrated into NixOS config (built with `nixos-rebuild`).
- In each `modules/users/<username>/default.nix`, both a `flake.homeModules.<name>` Home Manager module and a `flake.homeConfigurations.<name>` Home Manager configuration are defined. The Home Manager module is where all the config should go; the configuration simply imports the module. The configuration is the standalone version, while the module is integrated into the NixOS config of each host in `modules/hosts/<host name>/default.nix`.
- Package-specific config is put into `modules/users/<username>/home_manager/`, using the same Home Manager *module* name as the one in `modules/users/<username>/default.nix`. (Modules with the same name are merged by Nix.)
