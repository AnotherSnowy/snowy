{
  lib,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ./nh.nix
    ./wifi.nix
    ./boot.nix
    ./users.nix
    ./locale.nix
    ./cachix.nix
    ./console.nix
  ];

  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
  };

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  services = {
    chrony.enable = true;
    libinput.enable = true;
    journald.extraConfig = "SystemMaxUse=250M";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  environment = {
    variables.EDITOR = "nvim";
    systemPackages = import ./packages.nix {inherit pkgs;};
  };
}
