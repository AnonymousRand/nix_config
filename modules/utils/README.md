# `modules/utils`

reusable util aspects. to use one in an aspect, simply include it and set any declared options if appropriate (note that often these options are declared inside a class module instead of on the aspect level itself, since accessing aspect-level options from within a class module is kinda hard in den...).

### notes

- all options are to be declared under a "shared namespace" like `my` and then an aspect-specific one like `noctalia-theming` (so the full option path is `my.noctalia-theming.<options>`). this is so that consumers can differentiate between built-in configuration options and ones importing from these util aspects—follow the convention in the existing files for how to set this up (it's not the most elegant, sowwy ._.)
