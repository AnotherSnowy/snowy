{
  stdenv,
  lib,
  fetchFromGitHub,
  autoreconfHook,
  ncurses,
  readline,
}:
stdenv.mkDerivation {
  pname = "bibtool";
  version = "2.68-git";

  src = fetchFromGitHub {
    owner = "ge-ne";
    repo = "bibtool";
    rev = "master";
    sha256 = "sha256-MnT/Udr/9ptHwurLDbCSfg3Hh8VsTGV/rbkiix779/c=";
  };
  postPatch = ''
    sed -i 's/int (\*show)(void)/int (*show)(char *)/' include/bibtool/pxfile.h
    sed -i '/AX_APPEND_COMPILE_FLAGS.*-Wno-old-style-definition/d' configure.ac
  '';
  nativeBuildInputs = [autoreconfHook];
  buildInputs = [
    ncurses
    readline
  ];

  NIX_CFLAGS_COMPILE =
    "-Wno-old-style-definition"
    + " -Wno-error=implicit-function-declaration"
    + " -Wno-error=builtin-declaration-mismatch"
    + " -Wno-error=missing-parameter-type"
    + " -std=gnu89";

  meta = with lib; {
    description = "Bibliography tool for LaTeX/BibTeX";
    homepage = "https://github.com/ge-ne/bibtool";
    license = licenses.gpl2Plus;
    maintainers = [];
    platforms = platforms.unix;
  };
}
