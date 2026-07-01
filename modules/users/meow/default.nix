{ self, inputs, ... }: {
  flake.nixosModules.meow = { pkgs, ... }: {
    # import user-specific features here!
    # don't forget to set a password with ‘passwd’!
    users.users."meow" = {
      isNormalUser = true;
      description = "AnonymousRand";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # Home Manager config module, which can be both integrated into NixOS configs
  # (i.e. built with `nixos-rebuild` command) or used standalone (i.e. built with `home-manager` command)
  flake.homeModules.meow = {
    home.username = "meow";
    home.homeDirectory = "/home/meow";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true; # enables `home-manager` command
  };

  # the same Home Manager config as a standalone (to be used with `home-manager --flake .#<username>` command)
  # TODO: how to make this system-agnostic? using `perSystem` changes the name and makes it weird to invoke on CLI
  flake.homeConfigurations.meow = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      self.homeModules.meow
    ];
  };
}
