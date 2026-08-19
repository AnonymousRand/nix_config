let
  fontName = "Maple Mono NF";
in
import ../../../_user_systs.nix {
  usrSettings.theme.fonts.list.${fontName} = {
    size = {
      normal = 12;
    };
    enabledFontFeatures = [
      # keep normal commas and semicolons
      "cv61"
    ];
    disabledFontFeatures = [
      # disable programming ligatures
      "calt"
    ];
  };
}
