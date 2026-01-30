{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    kernelParams = ["boot.shell_on_fail"];
  };

  console = {
    enable = true;
    earlySetup = true;
    packages = with pkgs; [
      terminus_font
      powerline-fonts
    ];
    font = "ter-powerline-v32n";
  };
}
