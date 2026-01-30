{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    NIXOS_OZNNE_WL = "1";
    GTK_USE_PORTAL = "1";
    GDK_DEBUG = "portals";
    TERMINAL = "kitty";
    TERM = "kitty";
    BROWSER = "zen-beta";
  };

  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };
    udisks2.enable = true;
    flatpak.enable = true;
    gnome.sushi.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = ["gtk"];
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  programs.dconf.enable = true;
}
