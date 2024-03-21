{ pkgs ? import <nixpkgs> { } }:

with pkgs;
pkgs.mkShell {
  name = "dmenu";
  buildInputs = with pkgs; [ 
      xorg.libXft 
      xorg.libXinerama 
      imlib2
  ];
}
