{config, ...}: {
  programs.noctalia-shell.settings.wallpaper = {
    automationEnabled = true;
    enableMultiMonitorDirectories = false;
    enabled = true;
    fillColor = "#000000";
    fillMode = "crop";
    hideWallpaperFilenames = false;
    monitorDirectories = [];
    overviewEnabled = true;
    panelPosition = "center";
    randomIntervalSec = 300;
    setWallpaperOnAllMonitors = true;
    showHiddenFiles = true;
    solidColor = "#1a1a2e";
    transitionDuration = 1500;
    transitionEdgeSmoothness = 0.05;
    transitionType = "fade";
    useSolidColor = false;
    useWallhaven = false;
    viewMode = "browse";
    wallhavenApiKey = "";
    wallhavenCategories = "111";
    wallhavenOrder = "desc";
    wallhavenPurity = "100";
    wallhavenQuery = "";
    wallhavenRatios = "";
    wallhavenResolutionHeight = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenSorting = "relevance";
    wallpaperChangeMode = "alphabetical";
  };
  xdg.cacheFile."noctalia/wallpapers.json".text = builtins.toJSON {defaultWallpaper = config.stylix.image;};
}
