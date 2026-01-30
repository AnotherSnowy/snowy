{pkgs, ...}: {
  swhkd = pkgs.callPackage ./swhkd/package.nix {};
  bibtool = pkgs.callPackage ./bibtool/package.nix {};
}
