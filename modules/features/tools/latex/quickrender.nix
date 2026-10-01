{
  # for the tool at files.anonymousrand.xyz/public/sync/latex/notes/quick_render/
  den.aspects.features.tools.latex.quickrender = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.ghostscript
        pkgs.imagemagick
      ];
    };
  };
}
