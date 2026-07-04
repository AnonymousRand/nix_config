{
  perSystem = { pkgs, self', ... }: {
    inputsFrom = [
      ./cpp.nix
    ];

    devShells.noctalia = pkgs.mkShell {
      packages = with pkgs; [
        wayland-protocols
        libglvnd
        freetype
        fontconfig
        cairo
        pango
        harfbuzz
        libxkbcommon
        glib
        sdbus-cpp
        polkit
      ];
    };
  };
}
