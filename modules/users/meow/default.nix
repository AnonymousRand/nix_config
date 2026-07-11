{ self, inputs, ... }: {
  flake.nixosModules.meow = { pkgs, ... }: {
    # don't forget to set a password with ‘passwd’!
    users.users."meow" = {
      isNormalUser = true;
      description = "AnonymousRand";
      extraGroups = [ "networkmanager" "wheel" ];
    };

    imports = [
      # packages to be installed at the system/host level (if this user is present on host)
      self.nixosModules.fish
      self.nixosModules.ghostty
      self.nixosModules.kitty
      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.vim
    ];
  };

  # Home Manager config module, which can be both integrated into NixOS configs
  # (i.e. built with `nixos-rebuild` command) or used standalone (i.e. built with `home-manager` command)
  flake.homeModules.meow = {
    home.username = "meow";
    home.homeDirectory = "/home/meow";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true; # enables `home-manager` command

    home.sessionVariables = {
      TERMINAL = "ghostty";
    };

    imports = [
      ./colors.nix
    ];
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
