{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfig

      ##########################################################################
      # users

      self.nixosModules.meow

      # integrate Home Manager config for all users on this host
      # (so they're also built when `nixos-rebuild --flake .#<host name>` command is run)
      inputs.home-manager.nixosModules.home-manager # to allow integrated Home Manager configs
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        #home-manager.backupFileExtension = "backup"; # allow overriding of non-Home-Manager configs

        home-manager.users.meow = self.homeModules.meow;
      }

      ##########################################################################
      # packages

      # desktop
      self.nixosModules.niri
      self.nixosModules.noctalia
      #self.nixosModules.noctalia-v4
      self.nixosModules.noctalia-greeter
      self.nixosModules.stylix
      self.nixosModules.xwayland-satellite

      # Logitech mouse config
      self.nixosModules.solaar

      # other
      self.nixosModules.playerctl # control media players that use MPRIS
      self.nixosModules.nvtop
      self.nixosModules.wl-color-picker
    ];
  };
}
