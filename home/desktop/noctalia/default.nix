{username, ...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      ui = {
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = true;
        fontDefault = "JetBrainsMono Nerd Font Mono";
        fontDefaultScale = 1.25;
        fontFixed = "JetBrainsMono Nerd Font Mono";
        fontFixedScale = 1.25;
        networkPanelView = "wifi";
        panelBackgroundOpacity = 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "centered";
        tooltipsEnabled = true;
        wifiDetailsViewMode = "grid";
      };
      general = {
        avatarImage = "/home/${username}/.face";
        boxRadiusRatio = 1;
        dimmerOpacity = 0;
        enableLockScreenCountdown = true;
        enableShadows = true;
        iRadiusRatio = 1;
        lockOnSuspend = true;
        radiusRatio = 0.5;
        scaleRatio = 1.15;
        shadowDirection = "top";
        showChangelogOnStartup = true;
        showHibernateOnLockScreen = true;
        showSessionButtonsOnLockScreen = true;
      };
      setupCompleted = true;
      location.name = "鲁山县,河南省";
    };
  };

  imports = [./bar.nix ./misc.nix ./swhkd.nix ./session.nix ./systemd.nix ./wallpaper.nix];
}
