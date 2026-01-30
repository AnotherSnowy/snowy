# copy from: "https://github.com/EdenQwQ/nixos".
{
  lib,
  config,
  ...
}: let
  inherit
    (config.lib.stylix.colors.withHashtag)
    base01
    base08
    base0A
    base07
    base0D
    base0B
    base0E
    ;
  moduleCfg = symbol: {
    style = "bg:overlay fg:pine";
    format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
    disabled = false;
    inherit symbol;
  };
in {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$fill"
        "$c"
        "$elixir"
        "$elm"
        "$golang"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "$scala"
        "$python"
        "$container"
        "$nix_shell"
        "$time"
        "\n"
        "$character"
      ];

      palette = "rose-pine";

      palettes.rose-pine = {
        overlay = "${base01}";
        love = "${base08}";
        gold = "${base0A}";
        rose = "${base07}";
        pine = "${base0D}";
        foam = "${base0B}";
        iris = "${base0E}";
      };

      character = {
        format = "$symbol ";
        success_symbol = "[╰─](bold iris)[ 󰈺](bold iris)";
        error_symbol = "[╰─](bold iris)[ 󰈺](bold love)";
        vimcmd_symbol = "[╰─](bold iris)[ 󰈺](bold foam)";
        vimcmd_visual_symbol = "[╰─](bold iris)[ 󰈺](bold pine)";
        vimcmd_replace_symbol = "[╰─](bold iris)[ 󰈺](bold gold)";
        vimcmd_replace_one_symbol = "[╰─](bold iris)[ 󰈺](bold gold)";
      };

      container = {
        format = " [$symbol $name]($style) ";
        symbol = " ";
        style = "love bold";
        disabled = false;
      };

      directory = {
        format = "[╭─ $path ]($style)";
        style = "bold iris";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙";
          Pictures = " ";
        };
      };

      fill = {
        style = "fg:overlay";
        symbol = " ";
      };

      git_branch = {
        format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) ";
        style = "bg:overlay fg:foam";
        symbol = " ";
      };

      git_status = {
        disabled = false;
        style = "fg:love";
        format = "([$all_status$ahead_behind]($style))";
        up_to_date = "[ 󰋑 ](fg:iris)";
        untracked = "[?($count)](fg:gold)";
        stashed = "[$](fg:iris)";
        modified = "[!($count)](fg:gold)";
        renamed = "[»($count)](fg:iris)";
        deleted = "[✘($count)](style)";
        staged = "[++($count)](fg:gold)";
        ahead = "[⇡($count)](fg:foam)";
        diverged = "⇡[$ahead_count](fg:foam)⇣[$behind_count](fg:rose)";
        behind = "[⇣($count)](fg:rose)";
      };

      time = {
        disabled = false;
        format = " [](fg:overlay)[ $time 󰧱 ]($style)[](fg:overlay)";
        style = "bg:overlay fg:purple";
        time_format = "%H:%M";
        use_12hr = true;
      };

      username = {
        disabled = false;
        format = "[](fg:overlay)[ 󰧱 $user ]($style)[](fg:overlay) ";
        show_always = true;
        style_root = "bg:overlay fg:iris";
        style_user = "bg:overlay fg:iris";
      };
      nix_shell = {
        format = "via [$symbol$state ($name)]($style) ";
        symbol = "󱄅 ";
        style = "bold foam";
        impure_msg = "impure";
        pure_msg = "pure";
        unknown_msg = "";
        disabled = false;
        heuristic = false;
      };
      conda = {
        style = "bg:overlay fg:pine";
        format = " [](fg:overlay)[ $symbol$environment ]($style)[](fg:overlay)";
        disabled = false;
        symbol = "🅒 ";
      };
      c = moduleCfg " ";
      elixir = moduleCfg " ";
      elm = moduleCfg " ";
      golang = moduleCfg " ";
      haskell = moduleCfg " ";
      java = moduleCfg " ";
      julia = moduleCfg " ";
      nodejs = moduleCfg "󰎙 ";
      nim = moduleCfg "󰆥 ";
      rust = moduleCfg " ";
      scala = moduleCfg " ";
      python = moduleCfg " ";
    };
  };
}
