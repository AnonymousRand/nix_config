{
  den.reservedKeys = [
    # reserve `settings` key so settings generator in `_settings_generator.nix` can work
    # without den thinking that `settings` is one of their special aspect keys
    "settings"
  ];
}
