{ stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "kubectl-reveal-secret";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = "kubectl-reveal-secret";
    rev = "v${version}";
    sha256 = "sha256-B7KdDW+eB9tYwOkpaVqSCoToaOqyZUKx8u8vVGB6dwM=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    install $src/kubectl-reveal-secret $out/bin
  '';
}
