let
  fontName = "Maple Mono NF";
in
import ../../../_cfg_all_profiles_for_user.nix {
  profileSettings.theme.fonts.list.${fontName} = {
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
