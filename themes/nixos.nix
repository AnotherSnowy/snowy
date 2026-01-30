{
  stylix.targets = {
    gtk.enable = true;
    console.enable = true;
    plymouth.enable = true;
    fontconfig.enable = true;
    font-packages.enable = true;
  };

  imports = [./common.nix];
}
