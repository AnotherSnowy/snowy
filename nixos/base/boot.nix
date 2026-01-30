{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 4;
      };
      efi.canTouchEfiVariables = true;
    };
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };
    tmp.cleanOnBoot = true;
    initrd.verbose = false;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
