let
  configHome = builtins.getEnv "XDG_CONFIG_HOME";
  noctaliaConfig = configHome + "/noctalia/settings.json";
  getFullContent = value: builtins.trace loadFile.${value} null;
  loadFile = builtins.fromJSON (builtins.readFile noctaliaConfig);
in
  builtins.listToAttrs (
    map (node: {
      name = node;
      value = getFullContent node;
    }) (builtins.attrNames loadFile)
  )
