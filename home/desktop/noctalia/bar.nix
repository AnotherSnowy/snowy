{
  programs.noctalia-shell.settings.bar = {
    widgets = {
      center = [
        {
          colorizeIcons = false;
          hideMode = "visible";
          id = "ActiveWindow";
          maxWidth = 210;
          scrollingMode = "hover";
          showIcon = true;
          useFixedWidth = true;
        }
      ];
      left = [
        {
          colorizeDistroLogo = false;
          colorizeSystemIcon = "primary";
          customIconPath = "";
          enableColorization = true;
          icon = "category";
          id = "ControlCenter";
          useDistroLogo = true;
        }
        {
          characterCount = 2;
          colorizeIcons = false;
          emptyColor = "secondary";
          enableScrollWheel = true;
          focusedColor = "primary";
          followFocusedScreen = false;
          groupedBorderOpacity = 1;
          hideUnoccupied = false;
          iconScale = 0.8;
          id = "Workspace";
          labelMode = "none";
          occupiedColor = "secondary";
          reverseScroll = false;
          showApplications = false;
          showBadge = true;
          showLabelsOnlyWhenOccupied = true;
          unfocusedIconsOpacity = 1;
        }
        {
          compactMode = false;
          diskPath = "/";
          id = "SystemMonitor";
          showCpuTemp = true;
          showCpuUsage = true;
          showDiskUsage = true;
          showGpuTemp = false;
          showLoadAverage = false;
          showMemoryAsPercent = false;
          showMemoryUsage = true;
          showNetworkStats = true;
          showSwapUsage = false;
          useMonospaceFont = true;
          usePrimaryColor = true;
        }
      ];
      right = [
        {
          blacklist = [];
          colorizeIcons = false;
          drawerEnabled = true;
          hidePassive = false;
          id = "Tray";
          pinned = [];
        }
        {
          displayMode = "onhover";
          id = "VPN";
        }
        {
          displayMode = "alwaysHide";
          id = "Network";
        }
        {
          displayMode = "onhover";
          id = "Bluetooth";
        }
        {
          displayMode = "onhover";
          id = "Brightness";
        }
        {
          displayMode = "onhover";
          id = "Volume";
          middleClickCommand = "pwvucontrol || pavucontrol";
        }
        {
          deviceNativePath = "__default__";
          displayMode = "onhover";
          hideIfIdle = false;
          hideIfNotDetected = true;
          id = "Battery";
          showNoctaliaPerformance = true;
          showPowerProfiles = true;
          warningThreshold = 30;
        }
        {
          customFont = "";
          formatHorizontal = "yyyy-MM-dd HH:mm";
          formatVertical = "HH mm - dd MM";
          id = "Clock";
          tooltipFormat = "HH:mm ddd, MMM dd";
          useCustomFont = false;
          usePrimaryColor = true;
        }
        {
          displayMode = "forceOpen";
          id = "KeyboardLayout";
          showIcon = true;
        }
        {
          hideWhenZero = false;
          hideWhenZeroUnread = false;
          id = "NotificationHistory";
          showUnreadBadge = true;
          unreadBadgeColor = "primary";
        }
        {
          colorName = "error";
          id = "SessionMenu";
        }
      ];
    };
    backgroundOpacity = 1;
    barType = "framed"; # This option is not effective now. Time: 2026-01-30 19:00
    capsuleOpacity = 1;
    density = "comfortable";
    exclusive = true;
    floating = false;
    frameRadius = 24;
    frameThickness = 10;
    hideOnOverview = true;
    marginHorizontal = 4;
    marginVertical = 4;
    monitors = [];
    outerCorners = false;
    position = "top";
    screenOverrides = [];
    showCapsule = true;
    showOutline = false;
    useSeparateOpacity = true;
  };
}
