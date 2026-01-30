{
  nixConfig = {extra-experimental-features = ["nix-command" "flakes"];};

  inputs = {
    ndg.url = "github:feel-co/ndg";
    nvf.url = "github:notashelf/nvf";
    compat.url = "path:vendors/compat";
    systems.url = "path:vendors/systems";
    flake-parts.url = "path:vendors/parts";
    niri.url = "github:sodiboo/niri-flake";
    catppuccin.url = "github:catppuccin/nix";
    disko.url = "github:nix-community/disko";
    stylix.url = "github:nix-community/stylix";
    nixpkgs-nur.url = "github:nix-community/NUR";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    noctalia-shell.url = "github:noctalia-dev/noctalia-shell";

    nvf.inputs = {
      ndg.follows = "ndg";
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      flake-compat.follows = "compat";
      flake-parts.follows = "flake-parts";
    };

    niri.inputs = {
      nixpkgs.follows = "nixpkgs";
      nixpkgs-stable.follows = "nixpkgs-stable";
    };

    spicetify-nix.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    stylix.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      flake-parts.follows = "flake-parts";
    };

    nixpkgs-nur.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-parts.follows = "flake-parts";
    };

    ndg.inputs.nixpkgs.follows = "nixpkgs";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    noctalia-shell.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = inputs @ {flake-parts, ...}: flake-parts.lib.mkFlake {inherit inputs;} {imports = [./hosts];};
}
