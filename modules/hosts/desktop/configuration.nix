{ self, inputs, ... }: {
  flake.nixosModules.desktopConfig = { config, pkgs, ... }: {
    # this should be kept as the release version of the first install of this system
    system.stateVersion = "26.05"; # Did you read the comment?
  
    networking.hostName = "snow-rainbow";             # define hostname
    networking.networkmanager.wifi.powersave = false; # maybe help with wifi issues after suspend

    # nix store auto clean up
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";
    nix.gc.options = "--delete-older-than 30d";
  
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
  
    # allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # extend sudo password validity duration and remove incorrect password timer
    security.sudo = {
      extraConfig = ''
        Defaults timestamp_timeout=30
      '';
    };
    security.pam.services.sudo.nodelay = true;

    # enable bluetooth
    hardware.bluetooth.enable = true;

    # enable power profile (e.g. for Noctalia)
    services.power-profiles-daemon.enable = true;

    # enable battery status feature
    #services.upower.enable = true;
  };
}
