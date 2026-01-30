{inputs}: let
  inherit (inputs.nixpkgs) lib;
  parameters =
    inputs'
    // {
      inherit lib inputs snowy;
    };
  inputs' = removeAttrs inputs ["self"];
  makeClouixScope = newScope: fnAttrs: let
    self =
      fnAttrs self
      // {
        snowy = fnAttrs;
        callScope = self.newScope parameters;
        newScope = scope: newScope (self // scope);
        extend = fn: lib.makeExtensible (lib.extends fn fnAttrs);
        overrideScope = fn: makeClouixScope newScope (lib.extends fn fnAttrs);
      };
  in
    self;
  snowy = makeClouixScope snowy.lambda (self: {
    swhkd = self.callScope ./swhkd.nix {};
    special = self.callScope ./special.nix {};
    trivial = self.callScope ./trivial.nix {};
    lambda = import ./lambda.nix {inherit lib;};
    flake-parts = self.callScope ./parts/lib {inherit (inputs.nixpkgs) rev;};
    inherit (inputs.nixpkgs.lib) nixosSystem;
    inherit (inputs.home-manager.lib) homeManagerConfiguration;
  });
in
  snowy
