{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostsCommon
      self.modules.nixos.desktop
      
      # load custom overlays (e.g. from `perSystem.overlayAttrs`)
      {
        nixpkgs.overlays = [ self.overlays.default ];
      }

      ##########################################################################
      # users

      self.modules.nixos.meow

      # integrate Home Manager config for all users on this host
      # (so they're also built when `nixos-rebuild --flake .#<host name>` command is run)
      inputs.home-manager.nixosModules.home-manager # to allow integrated Home Manager configs
      {
        home-manager = {
          useGlobalPkgs = true; # allow home manager to see `nixpkgs overlays
          useUserPackages = true;

          extraSpecialArgs = {
            inherit inputs;
          };

          users.meow = self.modules.homeManager.meow;
        };
      }

      ##########################################################################
      # features

      # desktop environment
      self.modules.nixos.niri
      self.modules.nixos.noctalia
      self.modules.nixos.noctaliaGreeter

      # system
      self.modules.nixos.efibootmgr
      self.modules.nixos.firmware
      self.modules.nixos.nvidia
      self.modules.nixos.xwayland-satellite

      # tools
      self.modules.nixos.bottom       # better `top`, or `htop` with `--basic`
      self.modules.nixos.hyprpicker   # color picker
      self.modules.nixos.nvtop        # GPU top
      self.modules.nixos.playerctl    # control media players that use MPRIS
      self.modules.nixos.solaar       # logitech mouse config
      self.modules.nixos.tokei        # code counter
      self.modules.nixos.wl-clipboard # wayland clipboard
      
      # other
      self.modules.nixos.firefox
    ];
  };
}
