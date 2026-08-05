# `modules/theme/`

reusable theming aspects (usually declaring their own options for configuration). to use one in an aspect, simply include it and set any declared options if appropriate.

### notes

- often these options are declared inside a class module instead of on the aspect level itself, since accessing aspect-level options from within a class module is kinda weird in den...
