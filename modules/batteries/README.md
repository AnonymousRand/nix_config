# `modules/batteries/`

reusable, OPTIONAL, "battery" or utility aspects that consume extra data (e.g. in the form of custom options or den quirks) for configuration.

### notes

- use these aspects as described in the general [modules/](../modules) readme
- currently, there are two ways for these aspects to consume data:
    - den quirks, which are essentially special variables that any aspect anywhere can produce data on and a consumer can just pull from. these are convenient, but avoid these if you can since they are forced to have flat names and hence can get messy in large amounts. (e.g. [./nix-ld.nix](./nix-ld.nix).)
    - custom module options, declared inside a class module like `homeManager` or `nixos` (i would love to have aspect-level options, but currently that doesn't work super well in den). use these over quirks if the data only needs to be consumed and produced from one class module and sort of conceptually fits the idea of being more "class-specific" instead of necessarily "aspect-specific". (e.g. [./noctalia_theming.nix](./noctalia_theming.nix).)
