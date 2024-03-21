{ stdenv, lib, fetchFromGitHub, libXft, libXinerama, imlib2 }:

stdenv.mkDerivation {
  name = "dmenu-atar13";
  version = "0-unstable-2021-06-18";


  src = fetchFromGitHub {
    owner = "atar13";
    repo = "dmenu";
    rev = "19559d23ab0c9c7c592f91d9af74016e407f4b4d";
    sha256 = "sha256-mpWvIc8j4vDoipCputK/JdO7m3bzDCQ9M8L1dXFOK+s=";
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
  };
}
