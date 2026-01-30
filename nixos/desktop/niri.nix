{pkgs, ...}: {
  programs.niri = {
    enable = true;
    useNautilus = true;
    package = pkgs.niri-unstable;
  };

  xdg.portal.config.niri.default = pkgs.lib.mkDefault [
    "gtk"
    "gnome"
  ];
}
