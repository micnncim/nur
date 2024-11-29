{ stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "gh-sync";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = "gh-sync";
    rev = "v${version}";
    sha256 = "sha256-0blsQZQevJ7YbBQ+lwgM41hg+RPcTICVMDgszh6MS9U=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm755 $src/gh-sync $out/bin/gh-sync
  '';
}
