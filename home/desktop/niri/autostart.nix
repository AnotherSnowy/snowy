{pkgs, ...}: let
  niri-autostart = pkgs.writeShellApplication {
    name = "niri-autostart";
    runtimeInputs = with pkgs; [
      swww
      systemd
      killall
    ];
    extraShellCheckFlags = [];
    bashOptions = [];
    text =
      # bash
      ''
        killall swhkd
        killall swhks
        swhks &
        doas swhkd -c ~/.config/niri/swhkd/niri.swhkdrc &
      '';
  };
in {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${niri-autostart}/bin/niri-autostart"];}
    {command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}
  ];
}
