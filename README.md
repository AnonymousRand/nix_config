# nix config

uhhh

a shoddy attempt at dendritic pattern with `flake-parts`

more documentation to come :3

(maybe)

## structure

### so like what the heck is a dendritic pattern

- don't quote me on this but [dendritic pattern](https://github.com/mightyiam/dendritic) is essentially a way to organize Nix configs where we organize modules by *feature,* such as packages or programs. each feature gets a single top-level module, and hosts and users simply pick out the features they want by importing their top-level modules.
- this doesn't mean all files have to be top-level modules; a single top-level module can be broken up and spread across several files by using the same module name and letting Nix automatically merge them together (e.g. the top-level modules for each user in `modules/users/` is spread across all their Home Manager files).
- dendritic pattern configs (including this one) often use [`flake-parts`](https://flake.parts) to help achieve this organization, which is like really confusing but it basically facilitates splitting up flakes and top-level modules into multiple files, and gives us flake-level options like `flake.nixosModules`. (these are exactly the "top-level modules" we give to each feature.)

### nixos config

- nixos configurations are defined in the `modules/hosts/<host name>/default.nix` files. each host picks out features like packages and users by simply importing their `self.nixosModules` modules.
- as per the dendritic pattern, features like packages and users should be their own top-level `flake.nixosModules.<name>` nixos modules and put into the folders `modules/packages/` and `modules/users/` respectively. (note that since all of them are top-level modules and can be referenced directly from `self.nixosModules` by name, the actual location in which the files are placed doesn't matter beyond organization/ease of development.)

### home manager config

- home manager configurations are defined per user in `modules/users/<username>/`, and have versions for both standalone configs (built with `home-manager` command) and configs integrated into nixos config (built with `nixos-rebuild`).
- in each `modules/users/<username>/default.nix`, both a `flake.homeModules.<name>` home manager module and a `flake.homeConfigurations.<name>` home manager configuration are defined. the home manager module is where all the config should go; the configuration simply imports the module. the configuration is the standalone version, while the module is integrated into the nixos config of each host in `modules/hosts/<host name>/default.nix`.
- package-specific config is put into `modules/users/<username>/features/`, using the same home manager *module* name as the one in `modules/users/<username>/default.nix`.
