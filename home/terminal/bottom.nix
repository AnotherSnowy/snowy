{
  programs.bottom = {
    enable = true;
    settings = {
      enable_gpu = true;
      row = [
        {
          ratio = 2;
          child = [
            {type = "cpu";}
            {type = "temp";}
          ];
        }
        {
          ratio = 2;
          child = [
            {type = "network";}
          ];
        }
        {
          ratio = 3;
          child = [
            {
              type = "proc";
              ratio = 1;
              default = true;
            }
          ];
        }
      ];
      flags.group_processes = true;
    };
  };

  catppuccin.bottom.enable = true;
}
