{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  pythonEnv = python2Packages.python.withPackages (p: with p; [ pygame ]);
in

stdenv.mkDerivation {
  pname = "flipdotsim";
  version = "unstable";

  src = ./flipdotsim.py;

  phases = [ "installPhase" "fixupPhase" ];

  buildInputs = [ pythonEnv ];

  installPhase = ''
    install -Dm755 $src $out/bin/flipdotsim
  '';
}
