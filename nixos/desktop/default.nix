{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./niri.nix
    ./sddm.nix
    ./audio.nix
    ./settings.nix
  ];

  boot = {
    kernelParams = [
      "quiet"
      "loglevel=3"
      "rd.udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    plymouth.enable = true;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.hurmit
      nerd-fonts.symbols-only
      liberation_ttf
      lxgw-wenkai
      maple-mono.variable
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = rec {
        serif = sansSerif;
        monospace = [
          "LXGW WenKai Mono"
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "LXGW WenKai Mono"
          "Noto Sans Mono CJK SC"
        ];
      };
      enable = true;
    };
    fontDir.enable = true;
    enableDefaultPackages = lib.mkForce false;
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
    nautilus
    zenity
    libheif
    libheif.out
  ];
}
