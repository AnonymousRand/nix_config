{
  den.aspects.hosts.snow-rainbow = {
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

      security.sudo = {
        # only allow users in the `wheel` group to use `sudo` in the first place
        execWheelOnly = true;
        keepTerminfo = true; # is default but just in case

        # extend sudo password validity duration
        extraConfig = ''
          Defaults timestamp_timeout=30
        '';
      };
      # extend sudo password validity duration remove incorrect password timer
      security.pam.services.sudo.nodelay = true;
    
      # allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # enable power profile (e.g. for Noctalia)
      services.power-profiles-daemon.enable = true;

      # nix store auto clean up
      nix.gc.automatic = true;
      nix.gc.dates = "weekly";
      nix.gc.options = "--delete-older-than 30d";
    };
  };
}
