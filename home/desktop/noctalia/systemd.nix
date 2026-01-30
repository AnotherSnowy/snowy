{
  pkgs,
  inputs,
  config,
  ...
}: {
  systemd.user.services.noctalia-shell = let
    noctaliaConfig = "${config.xdg.configHome}/noctalia/gui-settings.json";
    noctaliaPackage = inputs.noctalia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default;
  in {
    Unit = {
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
      StartLimitIntervalSec = 60;
      StartLimitBurst = 3;
      Restart-Triggers = [noctaliaPackage noctaliaConfig];
    };
    Service = {
      ExecStart = "${noctaliaPackage}/bin/noctalia-shell";
      Restart = "on-failure";
      RestartSec = 3;
      TimeoutStartSec = 10;
      TimeoutStopSec = 5;
      Environment = ["NOCTALIA_SETTINGS_FALLBACK=${noctaliaConfig}"];
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
