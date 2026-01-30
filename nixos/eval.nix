{
  lib,
  role,
  self,
  snowy,
  inputs,
  config,
  ...
}: let
  base = [./base];
  desktop = [./desktop];
  optional = {
    laptop = [
      ./optional/docs.nix
      ./optional/disks.nix
      ./optional/battery.nix
      ./optional/openssh.nix
      ./optional/bluetooth.nix
    ];
    desktop = [
      ./optional/docs.nix
      ./optional/disks.nix
      ./optional/openssh.nix
      ./optional/bluetooth.nix
    ];
  };
in {
  imports =
    snowy.trivial.switch role {
      laptop = lib.flatten [base desktop optional.laptop];
      desktop = lib.flatten [base desktop optional.desktop];
    }
    base;

  nix = {
    channel.enable = true;
    optimise.automatic = true;
    settings = {
      warn-dirty = false;
      keep-outputs = true;
      keep-derivations = true;
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
        "read-only-local-store"
      ];
      download-buffer-size = 262144000; # 250 MB (250 * 1024 * 1024)
    };
    registry = lib.mkForce (lib.mapAttrs (_: value: {flake = value;}) inputs);
    nixPath = lib.mkForce (
      lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry
    );
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
    };
    overlays = builtins.attrValues self.overlays;
  };
}
