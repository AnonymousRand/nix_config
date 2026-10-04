{
  den.aspects.profiles.meow = {
    homeManager = {
      programs.nix-search-tv = {
        settings = {
          indexes = [
            "nixpkgs"
            "nixos"
            "home-manager"
            "noogle"
          ];
        };
      };
    };
  };
}
