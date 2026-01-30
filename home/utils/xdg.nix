{
  config,
  lib,
  ...
}: {
  xdg = {
    enable = true;

    configHome = config.home.homeDirectory + "/.config";
    cacheHome = config.home.homeDirectory + "/.local/cache";
    dataHome = config.home.homeDirectory + "/.local/share";
    stateHome = config.home.homeDirectory + "/.local/state";

    userDirs = {
      enable = true;
      createDirectories = lib.mkDefault true;

      download = config.home.homeDirectory + "/downloads";
      pictures = config.home.homeDirectory + "/pictures";

      desktop = config.home.homeDirectory + "/desktop";
      documents = config.home.homeDirectory + "/documents";
      music = config.home.homeDirectory + "/music";
      publicShare = config.home.homeDirectory + "/publicShare";
      templates = config.home.homeDirectory + "/templates";
      videos = config.home.homeDirectory + "/videos";

      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/pictures/screenshots";
      };
    };
  };
}
