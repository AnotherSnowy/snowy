{username, ...}: {
  system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    flake = "/home/${username}/snowy";
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
    ];
    allowReboot = false;
  };
}
