{pkgs, ...}: {
  home.packages = with pkgs; [
    deadnix
    nil
    nixd
    nurl
    statix
    nixfmt
    alejandra
  ];
}
