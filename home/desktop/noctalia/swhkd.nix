{snowy, ...}: {
  xdg.configFile."noctalia/swhkd/noctalia.swhkdrc".text = with snowy.swhkd;
    mkSwhkdrc {
      keyBindings = [
        # tools
        (noctaliaCmd "super + c" "calendar toggle")
        (noctaliaCmd "super + e" "launcher emoji")
        (noctaliaCmd "super + z" "launcher clipboard")
        (noctaliaCmd "super + shift + w" "wallpaper toggle")
        # session
        (noctaliaCmd "super + x" "sessionMenu toggle")
        (noctaliaCmd "alt + ctrl + l" "lockScreen lock")
        # volume
        (noctaliaCmd "XF86AudioMute" "volume muteOutput")
        (noctaliaCmd "XF86AudioMicMute" "volume muteInput")
        (noctaliaCmd "XF86AudioRaiseVolume" "volume increase")
        (noctaliaCmd "XF86AudioLowerVolume" "volume decrease")
      ];
    };
}
