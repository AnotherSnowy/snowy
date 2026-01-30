{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.tabs.drawInTitlebar" = true;
        "browser.tabs.groups.enabled" = true;
        "browser.tabs.groups.smart.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
  stylix.targets.firefox = {
    enable = true;
    profileNames = ["default"];
    firefoxGnomeTheme.enable = true;
  };
}
