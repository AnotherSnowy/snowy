{
  pkgs,
  username,
  ...
}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 10d --keep 3";
    };
    package = pkgs.nh;
    flake = "/home/${username}/snowy";
  };
}
