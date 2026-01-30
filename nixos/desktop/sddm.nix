{
  pkgs,
  config,
  ...
}: let
  foreground = config.lib.stylix.colors.base05;
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      HeaderTextColor = "#${foreground}";
      DateTextColor = "#${foreground}";
      TimeTextColor = "#${foreground}";
      LoginFieldTextColor = "#${foreground}";
      PasswordFieldTextColor = "#${foreground}";
      UserIconColor = "#${foreground}";
      PasswordIconColor = "#${foreground}";
      WarningColor = "#${foreground}";
      LoginButtonBackgroundColor = "#${foreground}";
      SystemButtonsIconsColor = "#${foreground}";
      SessionButtonTextColor = "#${foreground}";
      VirtualKeyboardButtonTextColor = "#${foreground}";
      DropdownBackgroundColor = "#${foreground}";
      HighlightBackgroundColor = "#${foreground}";
      Background = "${toString config.stylix.image}";
    };
  };
  inherit (config.services.displayManager.sessionData) desktops;
in {
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    extraPackages = [sddm-astronaut];
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    settings.Wayland.SessionDir = "${desktops}/share/wayland-sessions";
  };

  environment.systemPackages = [sddm-astronaut];
}
