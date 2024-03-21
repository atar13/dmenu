{ stdenv, lib, fetchFromGitHub, libXft, libXinerama, imlib2 }:

stdenv.mkDerivation {
  name = "dmenu-atar13";
  version = "0-unstable-2021-06-18";


  src = fetchFromGitHub {
    owner = "atar13";
    repo = "dmenu";
    rev = "e56082aa49888a3550865ce3374006c187764c31";
    sha256 = "sha256-jHpWtsbW3o/P01SRSCsUGDstEgSSrE87YSWRx3wAnqY=";
  };

  buildInputs = [
    libXft
    libXinerama
    imlib2
  ];

  prePatch = ''
    substituteInPlace config.mk --replace '/usr/local' $out
  '';

  meta = with lib; {
    description = "atar13's fork of dmenu";
    homepage = "https://github.com/atar13/dmenu";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "dmenu";
  };
}
