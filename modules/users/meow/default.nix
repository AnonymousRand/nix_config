{ self, inputs, ... }: {
  flake.nixosModules.meow = {
    # don't forget to set a password with ‘passwd’!
    users.users."meow" = {
      isNormalUser = true;
      description = "AnonymousRand";
      extraGroups = [ "networkmanager" "wheel" ];
    };

    imports = [
      # features to be activated at the system/host level (if this user is present on host)
      self.nixosModules.fish
      self.nixosModules.ghostty
      self.nixosModules.kitty
      self.nixosModules.niri
      self.nixosModules.nixowos # system-level to change os-release
      self.nixosModules.noctalia
      self.nixosModules.vim
    ];
  };

  # Home Manager config module, which can be both integrated into NixOS configs
  # (i.e. built with `nixos-rebuild` command) or used standalone (i.e. built with `home-manager` command)
  flake.homeModules.meow = { lib, pkgs, ... }: {
    home.username = "meow";
    home.homeDirectory = "/home/meow";
    home.stateVersion = "26.05";

    home.sessionVariables = {
      TERMINAL = "ghostty";
    };

    programs.home-manager.enable = true; # enables `home-manager` command

    # expose top-level inputs to all instances of `flake.homeModules.meow`
    _module.args = {
      my = {
        theme = import ./_theme { inherit inputs lib pkgs; };
      };
    };
  };

  # the same Home Manager config as a standalone (to be used with `home-manager --flake .#<username>` command)
  # TODO: how to make this system-agnostic? using `perSystem` changes the name and makes it weird to invoke on CLI
  # maybe the good practice is to just create a separate `homeManagerConfiguration` for each architecture
  # maybe passing it as parameter to a custom function?
  flake.homeConfigurations.meow = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [ self.homeModules.meow ];
  };
}
