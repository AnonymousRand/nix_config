{ self, inputs, ... }: {
  flake.nixosModules.base = { config, pkgs, ... }: {
    imports = [
      # features to be installed on every host
      self.nixosModules.efibootmgr
      self.nixosModules.file
      self.nixosModules.git
      self.nixosModules.tree
      self.nixosModules.vim
      self.nixosModules.wget
    ];

    # bootloader
    # IMPORTANT: FOR UEFI DUAL-BOOTING WITH WINDOWS, use efibootmgr to put "UEFI OS"
    # or "Linux Boot Manager" higher in boot priority than Windows Boot Manager
    # (`/boot/EFI/BOOT/BOOTX64.EFI` and `/boot/EFI/systemd/systemd-boot...` respectively)
    # to access Windows, use firmware boot menu since GRUB is finnicky
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    # networking.wireless.enable = true;  # enables wireless support via wpa_supplicant
  
    # configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
    # enable network manager
    networking.networkmanager.enable = true;
  
    # enable Nix flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
