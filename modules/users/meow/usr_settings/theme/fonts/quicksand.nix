let
  fontName = "Quicksand Medium";
in
import ../../../_user_systs.nix {
  usrSettings.theme.fonts.list.${fontName} = {
    size = {
      normal = 12;
      gtk = 12.1;
    };
    weight = {
      # commented out since the fontconfig weights are bwoken for Quicksand 3:
      #opentype = 500;
    };
  };
}
