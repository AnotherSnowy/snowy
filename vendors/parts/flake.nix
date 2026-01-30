{
  description = "Flake basics described using the module system";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = inputs @ {nixpkgs-lib, ...}: let
    lib = import ./lib {
      inherit (nixpkgs-lib) lib;
      # Extra info for version check message
      rev =
        if nixpkgs-lib ? rev
        then " (nixpkgs-lib.rev: ${nixpkgs-lib.rev})"
        else "";
    };
    flakeModules = {
      easyOverlay = ./extras/easyOverlay.nix;
      flakeModules = ./extras/flakeModules.nix;
      modules = ./extras/modules.nix;
      partitions = ./extras/partitions.nix;
      bundlers = ./extras/bundlers.nix;
    };
  in
    lib.mkFlake {inherit inputs;} {
      systems = [];
      flake = {inherit lib flakeModules;};
    };
}
