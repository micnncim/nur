{ stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "gctx";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = "gctx";
    rev = "v${version}";
    sha256 = "sha256-D9qJ8Zk7kJQ9lfRDVOFvKBretLPu+Vz+crn5Y7u+jEk=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    install $src/gctx $out/bin
  '';
}
