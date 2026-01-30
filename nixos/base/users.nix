{
  pkgs,
  username,
  userHashPasswd,
  ...
}: {
  users = {
    users.${username} = {
      isNormalUser = true;
      hashedPassword = userHashPasswd;
      description = "${username} account.";
      extraGroups = [
        "video"
        "wheel"
        "networkmanager"
      ];
    };
    mutableUsers = false;
    defaultUserHome = "/home";
    defaultUserShell = pkgs.fish;
  };

  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [username];
          noPass = true;
          keepEnv = true;
        }
      ];
      package = pkgs.doas;
    };
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "ALL";
              options = ["NOPASSWD"];
            }
          ];
          users = [username];
        }
      ];
      package = pkgs.sudo;
    };
  };

  environment.systemPackages = [pkgs.home-manager];

  systemd.tmpfiles.rules = ["d /nix/var/nix/profiles/per-user/${username} 0755 ${username} root -"];
}
