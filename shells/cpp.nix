{
  perSystem = { pkgs, self', ... }: {
    devShells.cpp = pkgs.mkShell {
      packages = with pkgs; [
        clang
        cmake
        gcc
        gnumake
        just
        meson
      ];
    };
  };
}
