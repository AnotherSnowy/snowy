{lib}: {
  mkSwhkdrc = {
    keyBindings,
    includes ? [],
    ignores ? [],
    modes ? [],
    extraConfig ? "",
  }: let
    mkKeyBinding = {
      key,
      command,
      onRelease ? false,
      swallow ? true,
    }: let
      onReleasePrefix =
        if onRelease
        then "@"
        else "";
      swallowPrefix =
        if swallow
        then ""
        else "~";
    in ''
      ${onReleasePrefix}${swallowPrefix}${key}
          ${command}'';
    mkMode = {
      name,
      swallow ? true,
      oneoff ? false,
      keyBindings,
      enterKeys ? [],
      escapeKeys ? [],
    }: let
      swallowStr =
        if swallow
        then "swallow"
        else "";
      oneoffStr =
        if oneoff
        then "oneoff"
        else "";
    in
      lib.trivial.pipe (map (
          key:
            mkKeyBinding {
              inherit key;
              command = "notify-send 'entering mode ${name}' && @enter ${name}";
            }
        )
        enterKeys) [(builtins.concatStringsSep "\n")]
      + "\n"
      + "mode ${name} ${swallowStr} ${oneoffStr}\n"
      + lib.trivial.pipe (map mkKeyBinding keyBindings) [(builtins.concatStringsSep "\n")]
      + "\n"
      + lib.trivial.pipe (map (
          key:
            mkKeyBinding {
              inherit key;
              command = "notify-send 'exiting mode ${name}' && @escape";
            }
        )
        escapeKeys) [(builtins.concatStringsSep "\n")]
      + "\nendmode\n";
  in
    lib.trivial.pipe (
      map (f: "include ${f}") includes
      ++ map (k: "ignore ${k}") ignores
      ++ map mkKeyBinding keyBindings
      ++ map mkMode modes
    ) [(builtins.concatStringsSep "\n")]
    + extraConfig;

  niriAction = key: action: {
    inherit key;
    command = "niri msg action ${action}";
  };

  noctaliaCmd = key: cmd: {
    inherit key;
    command = "noctalia-shell ipc call ${cmd}";
  };
}
