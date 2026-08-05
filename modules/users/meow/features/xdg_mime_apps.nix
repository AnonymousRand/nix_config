{ den, meow, ... }: {
  meow.features.xdg-mime-apps = {
    includes = [
      den.aspects.features.xdg-mime-apps
    ];

    homeManager = {
      xdg.mimeApps = {
        defaultApplications = {
          "application/pdf" = "firefox.desktop";
          "text/html"       = "firefox.desktop";

          # images
          "image/avif"               = "swayimg.desktop";
          "image/bmp"                = "swayimg.desktop";
          "image/gif"                = "swayimg.desktop";
          "image/heif"               = "swayimg.desktop";
          "image/jp2"                = "swayimg.desktop";
          "image/jpeg"               = "swayimg.desktop";
          "image/jxl"                = "swayimg.desktop";
          "image/png"                = "swayimg.desktop";
          "image/qoi"                = "swayimg.desktop";
          "image/svg+xml"            = "swayimg.desktop";
          "image/svg+xml-compressed" = "swayimg.desktop";
          "image/tiff"               = "swayimg.desktop";
          "image/webp"               = "swayimg.desktop";
        };
      };
    };
  };
}
