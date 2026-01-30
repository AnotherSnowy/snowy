{snowy, ...}: {
  xdg.configFile."swhkd/basic.swhkdrc".text = snowy.swhkd.mkSwhkdrc {
    keyBindings = [
      {
        key = "super + shift + r";
        command = "pkill -HUP swhkd";
      }
    ];
  };
}
