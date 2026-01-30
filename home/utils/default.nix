{pkgs, ...}: {
  programs = {
    jq.enable = true;
    gpg.enable = true;
    home-manager.enable = true;
    git = {
      enable = true;
      settings.user = {
        name = "Clouix";
        email = "nyxusy@163.com";
      };
    };
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  home.file.".face".source = ./face.jpg;

  imports = [
    ./packages.nix
    ./xdg.nix
    ./lib.nix
    ./obs.nix
    ./music.nix
    ./fcitx5.nix
    ./udiskie.nix
    ./firefox.nix
    ./spicetify.nix
  ];
}
