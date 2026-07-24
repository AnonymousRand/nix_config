{
  den.aspects.hosts.desktop = {
    nixos = { config, lib, modulesPath, ... }: {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];
    
      boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      boot.initrd.kernelModules = [];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [];
    
      fileSystems."/" = {
        device = "/dev/disk/by-uuid/e3ba1c58-badd-4526-9772-29ff20e4b8f8";
        fsType = "ext4";
      };
    
      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/BD76-215B";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };
    
      swapDevices = [
        { device = "/dev/disk/by-uuid/e941b122-5292-4d69-ae58-dfdebcd28f9f"; }
      ];
    
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
