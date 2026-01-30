{pkgs, ...}: {
  home.packages = with pkgs; [
    imv
    mpv
    qq
    wechat
    fd
    zotero
    killall
    kdePackages.kdenlive
    appimage-run
    yad
    jq
    entr
    imagemagick
    ffmpeg
    ffmpegthumbnailer
    poppler-utils
    ueberzugpp
    nix-init
    vscode
    file
    nix-diff
    wl-clipboard
    pwvucontrol
  ];
}
