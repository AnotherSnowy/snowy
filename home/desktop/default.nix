{
  imports = [
    ./mime.nix
    ./packages.nix
    ./niri
    ./noctalia
    ./swhkd.nix
  ];
  fonts.fontconfig.enable = true;
}
