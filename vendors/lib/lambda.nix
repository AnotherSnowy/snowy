{lib}: autoArgs: fn: args: let
  f =
    if builtins.isFunction fn
    then fn
    else import fn;
  fargs = builtins.functionArgs f;
  allArgs = builtins.intersectAttrs fargs autoArgs // args;
  missingArgs = lib.filterAttrs (_name: value: !value) (
    removeAttrs fargs (builtins.attrNames allArgs)
  );
  getSuggestions = arg:
    lib.trivial.pipe (autoArgs // args) [
      builtins.attrNames
      (builtins.filter (lib.strings.levenshteinAtMost 2 arg))
      (lib.lists.sortOn (lib.strings.levenshtein arg))
      (lib.lists.take 3)
      (map (x: "\"" + x + "\""))
    ];
  prettySuggestions = suggestions:
    if suggestions == []
    then ""
    else if builtins.length suggestions == 1
    then ", did you mean ${builtins.elemAt suggestions 0}?"
    else ", did you mean ${builtins.concatStringsSep ", " (lib.lists.init suggestions)} or ${lib.lists.last suggestions}?";
  errorForArg = arg: let
    loc = builtins.unsafeGetAttrPos arg fargs;
    loc' =
      if loc != null
      then loc.file + ":" + toString loc.line
      else "<unknown location>";
  in
    "Function called without required argument \"${arg}\" at "
    + "${loc'}${prettySuggestions (getSuggestions arg)}";
  error = errorForArg (builtins.head (builtins.attrNames missingArgs));
in
  if missingArgs == {}
  then f allArgs
  else abort "snowy.lambda: ${error}"
