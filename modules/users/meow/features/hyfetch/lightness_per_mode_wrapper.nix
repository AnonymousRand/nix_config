{ pkgs, lightModeLightness, darkModeLightness }:

pkgs.writeShellApplication {
  # command-line executable name
  name = "hyfetch";

  # dependencies
  runtimeInputs = [
    pkgs.hyfetch
  ];

  # script to run on invocation
  text = ''
    mode=$(noctalia msg theme-mode-get)
    if [ $? -eq 0 ]; then
      echo 'Error while running `noctalia msg theme-mode-get`!'
      exit 1
    fi

    if [ "$mode" = 'light' ]; then
      hyfetch --c-set-l=${lightModeLightness}
    elif [ "$mode" = 'dark' ]; then
      hyfetch --c-set-l=${darkModeLightness}
    else
      echo '`noctalia msg theme-mode-get` outputted "$mode", what the heck ._.'
      exit 1
  ''
};
