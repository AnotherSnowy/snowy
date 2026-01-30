{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--margin=1"
      "--layout=reverse"
      "--border=none"
      "--info='hidden'"
      "--header=''"
      "--prompt='/ '"
      "-i"
      "--no-bold"
    ];
    enableFishIntegration = true;
  };
  stylix.targets.fzf.enable = true;
}
