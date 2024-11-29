{ stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "gh-pr-status";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = "gh-commands";
    rev = "v${version}";
    sha256 = "sha256-uUgzEZmR7PsRxGr9C7Bp5NXfkuNTVtXE38cIKjIOZB8=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm755 $src/commands/gh-pr-status $out/bin/gh-pr-status
  '';
}
