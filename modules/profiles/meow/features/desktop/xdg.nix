{
  den.aspects.profiles.meow = {
    homeManager = {
      xdg.mimeApps = {
        defaultApplications = {
          "application/pdf" = "firefox.desktop";
          "inode/directory" = "org.gnome.Nautilus.desktop";
          "text/html"       = "firefox.desktop";

          # images
          "image/avif"               = "org.gnome.Loupe.desktop";
          "image/bmp"                = "satty.desktop";
          "image/gif"                = "org.gnome.Loupe.desktop";
          "image/heif"               = "org.gnome.Loupe.desktop";
          "image/jp2"                = "satty.desktop";
          "image/jpeg"               = "satty.desktop";
          "image/jxl"                = "org.gnome.Loupe.desktop";
          "image/png"                = "satty.desktop";
          "image/qoi"                = "org.gnome.Loupe.desktop";
          "image/svg+xml"            = "org.inkspace.Inkscape.desktop";
          "image/svg+xml-compressed" = "org.inkspace.Inkscape.desktop";
          "image/tiff"               = "satty.desktop";
          "image/webp"               = "org.gnome.Loupe.desktop";
        };
      };
    };
  };
}
