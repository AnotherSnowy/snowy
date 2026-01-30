let
  disk = "/dev/nvme0n1";
  defaultBtrfsOpts = [
    "defaults"
    "compress=zstd:1"
    "ssd"
    "noatime"
    "nodiratime"
  ];
in {
  disko.devices.disk.main = {
    device = disk;
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
          size = "540M";
          type = "EF00";
        };
        swap = {
          content = {
            type = "swap";
            resumeDevice = true;
          };
          size = "19G";
        };
        root = {
          content = {
            type = "btrfs";
            extraArgs = ["-f"];
            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = defaultBtrfsOpts;
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = defaultBtrfsOpts;
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = defaultBtrfsOpts;
              };
              "@var" = {
                mountpoint = "/var";
                mountOptions = defaultBtrfsOpts;
              };
              "@snapshots" = {
                mountpoint = "/.snapshots";
                mountOptions = defaultBtrfsOpts;
              };
            };
          };

          size = "100%";
        };
      };
    };
  };
}
