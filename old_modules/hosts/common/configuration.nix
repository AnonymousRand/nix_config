{ self, inputs, ... }: {
  flake.modules.nixos.hostsCommon = { config, pkgs, ... }: {
    # bootloader
    # IMPORTANT: FOR UEFI DUAL-BOOTING WITH WINDOWS, use efibootmgr to put "UEFI OS"
    # or "Linux Boot Manager" higher in boot priority than Windows Boot Manager
    # (`/boot/EFI/BOOT/BOOTX64.EFI` and `/boot/EFI/systemd/systemd-boot...` respectively)
    # then to access windows, use firmware boot menu since grub is finnicky
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

    # features to be installed on every host
    imports = [
      self.modules.nixos.system-utils
      self.modules.nixos.git
      self.modules.nixos.vim
    ];
  };
}
