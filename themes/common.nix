{
  pkgs,
  style,
  ...
}: {
  stylix = {
    fonts = rec {
      serif = monospace;
      sansSerif = monospace;
      emoji = {
        name = "Joypixels";
        package = pkgs.joypixels;
      };
      monospace = {
        name = "Hurmit Nerd Font Mono";
        package = pkgs.nerd-fonts.hurmit;
      };
      sizes = {
        applications = 15;
        desktop = 15;
        popups = 15;
        terminal = 15;
      };
    };
    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 20;
    };
    enable = true;
    autoEnable = false;
  };

  imports = [./${style}];
}
