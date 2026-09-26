# IMPORTANT: FOR UEFI DUAL-BOOTING WITH WINDOWS, use efibootmgr to put "UEFI OS"
# or "Linux Boot Manager" higher in boot priority than Windows Boot Manager
# (`/boot/EFI/BOOT/BOOTX64.EFI` and `/boot/EFI/systemd/systemd-boot...` respectively)
# then to access windows, use firmware boot menu since grub is finnicky

{
  den.aspects.features.system.dual-boot = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.efibootmgr
      ];

      boot.loader.efi.canTouchEfiVariables = true;
    };
  };
}
