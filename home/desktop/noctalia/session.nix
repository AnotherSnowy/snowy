{
  programs.noctalia-shell.settings.sessionMenu = {
    powerOptions = [
      {
        action = "lock";
        command = "noctalia-shell ipc call lockScreen lock";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "suspend";
        command = "systemctl suspend";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "hibernate";
        command = "systemctl hibernate";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "reboot";
        command = "systemctl  reboot ";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "logout";
        command = "niri msg action quit --skip-confirmation";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "shutdown";
        command = "systemctl poweroff";
        countdownEnabled = true;
        enabled = true;
      }
    ];
    showHeader = true;
    position = "center";
    showNumberLabels = false;
    countdownDuration = 1000;
    enableCountdown = false;
    largeButtonsStyle = false;
    largeButtonsLayout = "grid";
  };
}
