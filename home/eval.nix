{
  self,
  pkgs,
  username,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      joypixels.acceptLicense = true;
      permittedInsecurePackages = ["electron-25.9.0"];
    };
    overlays = builtins.attrValues self.overlays;
  };
  home = {
    inherit username;
    packages = with pkgs; [
      cmatrix
      cbonsai
      flatpak
      peaclock
      pipes
    ];
    homeDirectory = "/home/${username}";
  };

  imports = [
    ./utils
    ./shell
    ./coding
    ./reader
    ./desktop
    ./terminal
  ];
}
