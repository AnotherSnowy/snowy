{pkgs, ...}: {
  programs.atuin = {
    enable = true;
    settings = {
      dotfiles = {
        enabled = false;
      };
      sync = {
        records = true;
      };
      enter_accept = false;
    };
    package = pkgs.atuin;
    flags = ["--disable-up-arrow"];
    enableFishIntegration = true;
  };
  programs.pay-respects = {
    enable = true;
    enableFishIntegration = true;
  };
}
