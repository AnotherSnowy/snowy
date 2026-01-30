{
  programs.eza = {
    enable = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--git-ignore"
      "--icons=always"
    ];
    enableFishIntegration = true;
  };

  programs.fish.shellAliases = {
    ls = "eza";
    tree = "eza --tree";
  };

  catppuccin.eza.enable = true;
}
