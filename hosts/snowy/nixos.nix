{
  imports = [./special];

  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
    supportedFilesystems = ["btrfs"];
  };

  system.stateVersion = "26.05";

  boot.kernelModules = ["kvm_intel"];
}
