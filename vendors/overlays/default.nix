{inputs, ...}: {
  nixpkgs-soures = final: _prev: let
    inherit (final.stdenv.hostPlatform) system;
  in {
    stable = import inputs.nixpkgs-stable {
      inherit system;
      overlays = [];
      config.allowUnfree = true;
      config.allowUnsupportedSystem = true;
    };
    community = import inputs.nixpkgs-nur {pkgs = final;};
  };

  /*
    modifications = final: _prev: let
    inherit (final.stdenv.hostPlatform) system;
  in {
  };
  */
  inherit (inputs.niri.overlays) niri;

  additions = final: _prev: import ../pkgs {pkgs = final;};
}
