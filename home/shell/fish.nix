{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      cd = "z";
      vim = "nvim";
      nixu = "nh os switch --ask";
      homeu = "nh home switch --ask";
      nixc = "doas systemctl start nh-clean.service";
    };
    shellAliases = {
      e = "exit";
      c = "clear";
      nix-shell = "nix-shell --command fish";
    };
    shellInit = ''
      zoxide init fish | source
      export PATH="$HOME/.local/bin:$HOME/.juliaup/bin:$PATH"
      set -g fish_color_command = blue --italics
      set -g fish_color_quote = yellow --italics
    '';
    plugins = with pkgs.fishPlugins; [
      {
        name = "puffer";
        inherit (puffer) src;
      }
      {
        name = "pisces";
        inherit (pisces) src;
      }
    ];
    functions = {
      fish_greeting = "";
    };
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
