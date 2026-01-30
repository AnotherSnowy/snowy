{lib}: let
  rootPath = ../..;
in {
  getRootFiles = xs: let
    root = lib.path.append rootPath;
  in
    map root xs;
  getRootSpecialFileInDiffDir = dirs: filename: let
    root = lib.path.append rootPath;
    paths = map (dir: "${dir}/${filename}.nix") dirs;
  in
    map root paths;
  getRootSpecialFilesInSameDir = dir: filenames: let
    root = lib.path.append rootPath;
    paths = map (filename: "${dir}/${filename}.nix") filenames;
  in
    map root paths;
  getAllPath = path:
    map (file: (path + "/${file}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path': type:
            (type == "directory") || ((path != "default.nix") && (lib.strings.hasSuffix ".nix" path'))
        ) (builtins.readDir path)
      )
    );
}
