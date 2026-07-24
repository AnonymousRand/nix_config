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
          # allows home manager to see `nixpkgs overlays
          useGlobalPkgs = true;
          # installs user packages into `/etc/profile/per-user/<username>/` (i.e.
          # `users.users.<username>.packages`) instead of the default `~/.nix-profile`
          # can be convenient for certain system-level things
          useUserPackages = true;

          # needed since user-specific modules are no longer flake-parts modules, and hence do not get
          # `inputs` automatically. also `_module.args` doesn't work, infinite recursion :(
          extraSpecialArgs = {
            inherit inputs;
          };

          users.meow = self.modules.homeManager.meow;
        };
      }

      ##########################################################################
      # features
      # (for all users on hosts; so less opinionated)

      # display manager/greeter
      # (can manage different WMs/DEs for each user; place those in user modules)
      self.modules.nixos.noctalia-greeter

      # system
      self.modules.nixos.efibootmgr
      self.modules.nixos.firmware
      self.modules.nixos.nixowos    # system-level to change os-release
      self.modules.nixos.nvidia
      self.modules.nixos.vim

      # tools
      self.modules.nixos.code-counters
      self.modules.nixos.system-monitors
      self.modules.nixos.wayland-utils
      self.modules.nixos.nvtop           # GPU top
      self.modules.nixos.playerctl       # control media players that use MPRIS
      self.modules.nixos.solaar          # logitech mouse config
      
      # other
      self.modules.nixos.firefox
    ];
  };
}
