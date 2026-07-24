{
  den.schema.host.includes = [
    {
      nixos = {
        # bootloader
        # IMPORTANT: FOR UEFI DUAL-BOOTING WITH WINDOWS, use efibootmgr to put "UEFI OS"
        # or "Linux Boot Manager" higher in boot priority than Windows Boot Manager
        # (`/boot/EFI/BOOT/BOOTX64.EFI` and `/boot/EFI/systemd/systemd-boot...` respectively)
        # then to access windows, use firmware boot menu since grub is finnicky
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        # enable network manager
        networking.networkmanager.enable = true;

        # enable nix flakes
        nix.settings.experimental-features = ["nix-command" "flakes"];
      };
    };
  ];
}
