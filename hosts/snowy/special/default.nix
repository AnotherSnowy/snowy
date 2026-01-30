{
  inputs,
  lib,
  ...
}: {
  imports = [
    ./partition.nix
    inputs.disko.nixosModules.disko
    inputs.nixos-hardware.nixosModules.common-hidpi
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];

  hardware.intelgpu = {
    driver = "i915";
    loadInInitrd = true;
    computeRuntime = "default";
    vaapiDriver = "intel-media-driver";
    enableHybridCodec = false;
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
