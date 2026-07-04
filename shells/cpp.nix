{
  perSystem = { pkgs, self', ... }: {
    devShells.cpp = pkgs.mkShell {
      packages = with pkgs; [
        cmake
        gnumake
        just
        meson
      ];
    };
  };
}
