{pkgs, ...}: {
  programs.noctalia-shell.settings = {
    appLauncher = {
      autoPasteClipboard = false;
      clipboardWrapText = true;
      customLaunchPrefix = "";
      customLaunchPrefixEnabled = false;
      enableClipPreview = true;
      enableClipboardHistory = true;
      enableSettingsSearch = true;
      iconMode = "native";
      ignoreMouseInput = false;
      pinnedApps = [];
      position = "center";
      screenshotAnnotationTool = "";
      showCategories = true;
      showIconBackground = true;
      sortByMostUsed = true;
      terminalCommand = "${pkgs.kitty}/bin/kitty -e";
      useApp2Unit = false;
      viewMode = "list";
      clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
      clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
    };
    colorSchemes = {
      schedulingMode = "off";
      useWallpaperColors = false;
    };
    nightLight = {
      enabled = false;
      forced = false;
      autoSchedule = false;
    };
    dock.enabled = false;
    controlCenter = {
      cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = true;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
      ];
      diskPath = "/";
      position = "close_to_bar_button";
      shortcuts = {
        left = [
          {id = "Network";}
          {id = "Bluetooth";}
          {id = "WallpaperSelector";}
          {id = "NoctaliaPerformance";}
        ];
        right = [
          {id = "Notifications";}
          {id = "PowerProfile";}
          {id = "KeepAwake";}
          {id = "NightLight";}
        ];
      };
    };
  };
  programs.noctalia-shell.systemd.enable = false;
}
