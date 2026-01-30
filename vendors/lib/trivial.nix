{lib}: {
  switch = value: branches: default:
    if builtins.isAttrs branches
    then branches.${value} or default
    else throw "nix-box.attrsets.switch: branches argument must be an attribute set, got ${builtins.typeOf branches}";
}
