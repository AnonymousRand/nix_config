{
  # TODO: remove when merged + nixpkgs updated
  # my own fork with NixOwOS support :3
  perSystem = { pkgs, ... }: {
    overlayAttrs.hyfetch = pkgs.hyfetch.overrideAttrs (previousAttrs: {
      src = pkgs.fetchFromGitHub {
        owner = "AnonymousRand";
        repo = "hyfetch";
        rev = "acd93aa806b73afdf23014b69cad46520829a57d";
        hash = "sha256-l//mOBPbOp59ohbqfvTU9AGq8Ipm33mFJYdsZCwFlnE=";
      };
    });
  };

  flake.nixosModules.hyfetch = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.hyfetch
    ];
  };
}
