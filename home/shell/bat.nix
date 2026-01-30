{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      style = "full";
      pager = "less -FR";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
    ];
  };
  catppuccin.bat.enable = true;
  programs.fish.shellAliases.cat = "bat --theme=base16 --color=always --paging=never --tabs=2 --wrap=never --plain";
}
