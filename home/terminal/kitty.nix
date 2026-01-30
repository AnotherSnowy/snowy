{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      initial_window_width = 1200;
      initial_window_height = 600;
      update_check_interval = 0;
      enable_audio_bell = false;
      cursor_trail_start_threshold = 0;
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      url_style = "curly";
      copy_on_select = "clipboard";
      cursor_shape = "Underline";
      cursor_underline_thickness = 3;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      window_padding_width = 10;
      open_url_with = "default";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
      bold_font = "family='Hurmit Nerd Font Mono' style=Regular variable_name=HurmitNerdFontMono";
      italic_font = "family='Hurmit Nerd Font Mono' style=Regular variable_name=HurmitNerdFontMono";
      bold_italic_font = "family='Hurmit Nerd Font Mono' style=Regular variable_name=HurmitNerdFontMono";
    };
    extraConfig = ''
      map ctrl+shift+p kitten hints --type path --program @
      map ctrl+shift+s kitten hints --type word --program @
      map ctrl+shift+l kitten hints --type line --program @

      symbol_map U+4E00-U+9FFF   Noto Sans Mono CJK SC
      symbol_map U+3400-U+4DBF   Noto Sans Mono CJK SC
      symbol_map U+20000-U+2A6DF Noto Sans Mono CJK SC
      symbol_map U+2A700-U+2B73F Noto Sans Mono CJK SC
      symbol_map U+2B740-U+2B81F Noto Sans Mono CJK SC
      symbol_map U+2B820-U+2CEAF Noto Sans Mono CJK SC
      symbol_map U+2CEB0-U+2EBEF Noto Sans Mono CJK SC
      symbol_map U+30000-U+3134F Noto Sans Mono CJK SC
      symbol_map U+F900-U+FAFF   Noto Sans Mono CJK SC
      symbol_map U+2F800-U+2FA1F Noto Sans Mono CJK SC

      symbol_map  U+E000-U+E00D Symbols Nerd Font
      symbol_map U+e0a0-U+e0a2,U+e0b0-U+e0b3 Symbols Nerd Font
      symbol_map U+e0a3-U+e0a3,U+e0b4-U+e0c8,U+e0cc-U+e0d2,U+e0d4-U+e0d4 Symbols Nerd Font
      symbol_map U+e5fa-U+e62b Symbols Nerd Font
      symbol_map U+e700-U+e7c5 Symbols Nerd Font
      symbol_map U+f000-U+f2e0 Symbols Nerd Font
      symbol_map U+e200-U+e2a9 Symbols Nerd Font
      symbol_map U+f400-U+f4a8,U+2665-U+2665,U+26A1-U+26A1,U+f27c-U+f27c Symbols Nerd Font
      symbol_map U+F300-U+F313 Symbols Nerd Font
      symbol_map U+23fb-U+23fe,U+2b58-U+2b58 Symbols Nerd Font
      symbol_map U+f500-U+fd46 Symbols Nerd Font
      symbol_map U+e300-U+e3eb Symbols Nerd Font
      symbol_map U+21B5,U+25B8,U+2605,U+2630,U+2632,U+2714,U+E0A3,U+E615,U+E62B Symbols Nerd Font
    '';
    shellIntegration.enableFishIntegration = true;
  };
  stylix.targets.kitty.enable = true;
  home.packages = [
    pkgs.termpdfpy
    pkgs.mdcat
  ];
}
