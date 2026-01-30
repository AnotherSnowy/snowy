{
  lib,
  self,
  inputs,
  ...
}: let
  getFileForModule = let
    mapAttrsMaybe = f: attrs:
      lib.pipe attrs [
        (lib.mapAttrsToList f)
        (builtins.filter (x: x != null))
        builtins.listToAttrs
      ];
  in
    dir: f:
      if builtins.pathExists dir
      then
        lib.pipe dir [
          builtins.readDir
          (mapAttrsMaybe (
            fn: type:
              if type == "regular"
              then let
                name = lib.removeSuffix ".nix" fn;
              in
                if name != fn
                then lib.nameValuePair name (f "${dir}/${fn}")
                else null
              else if type == "directory" && builtins.pathExists "${dir}/${fn}/default.nix"
              then lib.nameValuePair fn (f "${dir}/${fn}")
              else null
          ))
        ]
      else {};
in {
  perSystem = {pkgs, ...}: {
    packages = import ./pkgs {inherit pkgs;};
  };
  flake = {
    lib = import ./lib {inherit inputs;};
    overlays = import ./overlays {inherit inputs;};
    templates = import ./templates;
    homeModules = getFileForModule ./modules/home (fn: fn);
    nixosModules = getFileForModule ./modules/nixos (fn: fn);
    flakeModules = getFileForModule ./selfmodules/flake (fn: fn);
  };
  systems = import inputs.systems;
}
