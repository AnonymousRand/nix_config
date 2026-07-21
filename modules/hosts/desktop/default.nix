{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostsCommon
      self.nixosModules.desktopConfig
      
      # load custom overlays (e.g. from `perSystem.overlayAttrs`)
      {
        nixpkgs.overlays = [ self.overlays.default ];
      }

      ##########################################################################
      # users

      self.nixosModules.meow

      # integrate Home Manager config for all users on this host
      # (so they're also built when `nixos-rebuild --flake .#<host name>` command is run)
      inputs.home-manager.nixosModules.home-manager # to allow integrated Home Manager configs
      {
        home-manager.useGlobalPkgs = true; # allow home manager to see overlays for `nixpkgs
        home-manager.useUserPackages = true;

        home-manager.users.meow = self.homeModules.meow;
      }

      ##########################################################################
      # packages

      # desktop environment
      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.noctaliaGreeter
      self.nixosModules.xwayland-satellite
      
      # other
      self.nixosModules.firefox
      self.nixosModules.hyprpicker   # color picker
      self.nixosModules.nvtop        # GPU top
      self.nixosModules.playerctl    # control media players that use MPRIS
      self.nixosModules.solaar       # logitech mouse config
      self.nixosModules.tokei        # code counter
      self.nixosModules.wl-clipboard # wayland clipboard
    ];
  };
}
