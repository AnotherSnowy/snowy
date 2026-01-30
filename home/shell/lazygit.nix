{
  programs = {
    git = {
      enable = true;
      ignores = [
        ".cache/"
        ".DS_Store"
        ".idea/"
        "*.swp"
        "*.elc"
        "auto-save-list"
        ".direnv/"
        "node_modules"
        "result"
        "result-*"
      ];
      settings = {
        init.defaultBranch = "main";
        pull.rebase = "false";
        push.autoSetupRemote = true;
        color.ui = "1";
        commit.gpgsign = true;
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        disableStartupPopups = true;
        notARepository = "skip";
        promptToReturnFromSubprocess = false;
        update.method = "never";
        git = {
          commit.signOff = true;
          overrideGpg = true;
          parseEmoji = true;
        };
        gui = {
          showListFooter = false;
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          nerdFontsVersion = "3";
        };
      };
    };

    fish.shellAliases = {
      g = "lazygit";
    };

    fish.shellAbbrs = {
      ga = "git add";
      gc = "git commit";
      gcu = "git add . && git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";
      gaa = "git add .";
      gcm = "git commit -m";
    };
  };
  stylix.targets.lazygit.enable = true;

  home.file.".ssh/allowed_signers".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOA540eh889hZCmRDnfdMZ6yuq/AlFz0c5BacHhTgxNn";
}
