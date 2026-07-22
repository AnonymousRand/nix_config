{ self, inputs, ... }: {
  flake.modules.nixos.meow = {
    # don't forget to set a password with ‘passwd’!
    users.users."meow" = {
      isNormalUser = true;
      description = "AnonymousRand";
      extraGroups = [ "networkmanager" "wheel" ];
    };

    imports = [
      # features to be activated at the system/host level (if this user is present on host)
      self.modules.nixos.fish
      self.modules.nixos.ghostty
      self.modules.nixos.kitty
      self.modules.nixos.niri
      self.modules.nixos.nixowos # system-level to change os-release
      self.modules.nixos.noctalia
      self.modules.nixos.vim
    ];
  };

  # Home Manager config module, which can be both integrated into NixOS configs (i.e. built with
  # `nixos-rebuild` command) or used standalone (i.e. built with `home-manager` command)
  flake.modules.homeManager.meow = { lib, pkgs, ... }: {
    home.username = "meow";
    home.homeDirectory = "/home/meow";
    home.stateVersion = "26.05";

    home.sessionVariables = {
      TERMINAL = "ghostty";
    };

    programs.home-manager.enable = true; # enables `home-manager` command

    imports = [
      # features to be activated at the user level for this user (e.g. home manager configs)
      ./_features/bottom
      ./_features/fastfetch
      ./_features/fish
      ./_features/ghostty
      ./_features/git
      ./_features/hyfetch
      ./_features/kitty
      ./_features/niri
      ./_features/nixowos
      ./_features/noctalia
      ./_features/ssh
      ./_features/vim
    ];
  };

  # the same Home Manager config as a standalone (to be used with `home-manager --flake .#<username>` command)
  # TODO: how to make this system-agnostic? using `perSystem` changes the name and makes it weird to invoke on CLI
  # maybe the good practice is to just create a separate `homeManagerConfiguration` for each architecture
  # maybe passing it as parameter to a custom function?
  flake.homeConfigurations.meow = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

    extraSpecialArgs = {
      inherit inputs;
    };

    modules = [
      self.modules.homeManager.meow
    ];
  };
}
