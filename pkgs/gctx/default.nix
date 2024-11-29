{ stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "gctx";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = "gctx";
    rev = "v${version}";
    sha256 = "sha256-AvH8ITe62QE1j95oJpUdgWYRRXFuxxdJchy29lwx72c=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm755 $src/gctx $out/bin/gctx
  '';
}
