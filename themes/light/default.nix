{pkgs, ...}: {
  stylix = {
    icons = {
      enable = true;
      dark = "Tela-blue-dark";
      light = "Tela-blue-light";
      package = pkgs.tela-icon-theme;
    };
    polarity = "light";
    image = ./wallpapers/fav.png;
    base16Scheme = ./github.yaml;
  };

  catppuccin = {
    flavor = "mocha";
    accent = "blue";
  };
}
