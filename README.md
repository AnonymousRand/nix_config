# nix config

uhhh

a shoddy attempt at dendritic pattern with `flake-parts`

more documentation to come :3

(maybe)

## structure and conventions

### so like what the heck is a dendritic pattern

- don't quote me on this but [dendritic pattern](https://github.com/mightyiam/dendritic) is basically a way to organize Nix configs by *feature* or *aspect,* such as packages, users, and hosts. each feature gets a single top-level module, and hosts' nixos configurations/users' home manager configurations simply pick out the features they want by importing their top-level modules (such as under `self.modules`, instead of their relative filepaths). thus, instead of starting with hosts and defining the features they have as is the traditional approach, dendritic defines features first and hosts simply select them.

    this has a few advantages:
    - it makes code reuse (e.g. sharing a package between multiple users or hosts) very easy, since we just have to import the module in every place we want it to be
    - it also means our directory structure can be less "possessive" in that we won't tend to put host A's packages under `hostA/`, host B's packages under `hostB/`, and so on. this makes it easier to restructure things, remove features from a host, reuse features across multiple consumers, and so on.

- generally the reusable features get top-level modules, while non-reusable ones (e.g. user-specific home manager configs) fall back to lower-level modules like regular nix modules. this helps avoid cluttering the top-level namespace with a bunch of "private" modules.

### `flake-parts`

- dendritic pattern configs (including this one) often use [`flake-parts`](https://flake.parts) to help achieve this organization.
- `flake-parts` allows us to modularize our flake's outputs into a bunch of "top-level modules" in `flake.modules`/`self.modules`, using nix's automatic module merging to let us define each such module in a different file.will put our top-level feature modules in. these are the top-level modules that a dendritic config will often use, and they can be consumed anywhere within other modules via `self`.
- instead of being regular nix modules, the files containing these top-level `flake-parts` modules *assign* regular nix modules to something in this top-level `flake.modules`. they are also able to access `self` and `input` as arguments at the very top of the file.

### `flake.nix` and `flake-file`

- i use [`flake-file`](https://github.com/denful/flake-file) to autogenerate my `flake.nix`. it allows me to put inputs (into `flake-file.inputs`) inside their corresponding feature's module instead of all in `flake.nix`, and `flake-file` aggregates all these inputs into `flake.nix` when `nix run .#write-flake` is run.
- `flake-parts` modules still receive the exact same `inputs` argument (which contains all the aggregated `flake-file.inputs`).
- remember to run `nix run .#write-flake` every time you update the inputs :3

### naming conventions

- generally, module and package/derivation names are kebab-case, while module *options* (that are themselves not submodules), plain attrset attribute names, local variables, function arguments are camel case.

## okie i'll stop yapping :3

### nixos config

- as per the dendritic pattern, features, hosts, and users should be their own top-level `flake.modules.nixos.<name>` nixos modules and put into the folders `modules/features/`, `modules/hosts/`, and `modules/users/` respectively.
- nixos configurations, the ones that you actually evaluate with `nixos-rebuild`, are defined in the `modules/hosts/<host name>/default.nix` files. each host picks out features and users by simply importing their `self.modules.nixos` modules. as mentioned above, each host also has a top-level module, which contains its general configuration stuff typically found in the default `/etc/nixos/` config files; this module is also imported by that host's nixos configuration along with features and users.

### home manager config

- home manager configurations are defined per user in `modules/users/<username>/`, and have versions for both standalone configs (built with `home-manager` command) and configs integrated into nixos config (built with `nixos-rebuild`).
- in each `modules/users/<username>/default.nix`, both a `flake.modules.homeManager.<name>` home manager module and a `flake.homeConfigurations.<name>` home manager configuration are defined. the home manager module is where all the config should go; the configuration simply imports the module. the configuration is the standalone version, while the module is also integrated into the nixos config of each host in `modules/hosts/<host name>/default.nix`.
- feature-specific config per user is generally "private" to that user, and hence written as a lower-level regular nix module in `modules/users/<username>/_features/` (the underscore prefix tells `import-tree` in `flake.nix` to not import it, as only flake-parts (top-level) modules should be imported there).
