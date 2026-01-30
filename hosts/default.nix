{
  lib,
  self,
  inputs,
  ...
}: let
  builder = {
    role,
    hostname,
    style,
    system ? builtins.currentSystem,
    username ? "muxue",
    userHashPasswd ? null,
    extraHomeArgs ? {},
    extraHomeModules ? [],
    extraNixOSArgs ? {},
    extraNixOSModules ? [],
    ...
  }: let
    snowy = self.lib;
    homeModules' = snowy.special.getRootFiles [
      "themes/home.nix"
      "home/eval.nix"
    ];
    homeModules = lib.flatten [
      homeModules'
      inputs.niri.homeModules.niri
      inputs.stylix.homeModules.stylix
      inputs.nvf.homeManagerModules.default
      inputs.catppuccin.homeModules.default
      (builtins.attrValues self.homeModules)
      inputs.noctalia-shell.homeModules.default
      inputs.spicetify-nix.homeManagerModules.default
    ];
    nixosModules' = snowy.special.getRootFiles [
      "themes/nixos.nix"
      "nixos/eval.nix"
    ];
    nixosModules = lib.flatten [
      nixosModules'
      inputs.stylix.nixosModules.stylix
      inputs.catppuccin.nixosModules.default
      inputs.nixpkgs.nixosModules.notDetected
      (builtins.attrValues self.nixosModules)
    ];
  in {
    nixosConfigurations.${hostname} = snowy.nixosSystem {
      inherit system;
      specialArgs =
        {
          inherit
            role
            self
            style
            snowy
            inputs
            username
            hostname
            userHashPasswd
            ;
        }
        // extraNixOSArgs;
      modules = nixosModules ++ extraNixOSModules;
    };
    homeConfigurations."${username}@${hostname}" = snowy.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs =
        {
          inherit
            role
            self
            style
            snowy
            inputs
            username
            hostname
            ;
        }
        // extraHomeArgs;
      modules = homeModules ++ extraHomeModules;
    };
  };
  registry = import ./registry.nix;
  allMachines = lib.pipe registry [
    (map builder)
    (builtins.foldl' (left: right: left // right) {})
  ];
in {
  flake = allMachines;

  imports = [../vendors];
}
