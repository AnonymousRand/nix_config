{
  den.aspects.hosts.desktop = {
    nixos = {
      # set time zone
      time.timeZone = "America/Los_Angeles";
    
      # select internationalization properties
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    
      # configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # extend sudo password validity duration and remove incorrect password timer
      security.sudo = {
        extraConfig = ''
          Defaults timestamp_timeout=30
        '';
      };
      security.pam.services.sudo.nodelay = true;
    
      # allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # enable bluetooth
      hardware.bluetooth.enable = true;

      # enable power profile (e.g. for Noctalia)
      services.power-profiles-daemon.enable = true;

      # maybe help with wifi issues after suspend
      networking.networkmanager.wifi.powersave = false;

      # nix store auto clean up
      nix.gc.automatic = true;
      nix.gc.dates = "weekly";
      nix.gc.options = "--delete-older-than 30d";
    };
  };
}
