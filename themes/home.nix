{style, ...}: {
  stylix.targets = {
    qt.enable = true;
    gtk.enable = true;
    fontconfig.enable = true;
    font-packages.enable = true;
  };
  imports = [./common.nix ./${style}/home.nix];
}
