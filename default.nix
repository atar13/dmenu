{ pkgs ? import <nixpkgs> { } }:

with pkgs;
{
  dmenu = pkgs.callPackage ./package.nix { };
}
