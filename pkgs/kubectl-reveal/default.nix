{ pkgs, lib, stdenv, fetchFromGitHub, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "kubectl-reveal";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-03r0HEActr5s4u5O4fZ7y7KVDOg29S9TsMWoCNB4Ces=";
  };

  cargoSha256 = "sha256-F6uhNVSq+qEJdWQjP5WJfbag8LXReqH6yLQ1pSAkUTg=";

  nativeBuildInputs = with pkgs;[
    installShellFiles

    pkg-config
  ];

  buildInputs = with pkgs;[
    openssl
  ];

  postInstall = ''
    installShellCompletion --cmd kubectl-reveal \
      --bash <($out/bin/kubectl-reveal completion bash) \
      --fish <($out/bin/kubectl-reveal completion fish) \
      --zsh <($out/bin/kubectl-reveal completion zsh)
  '';
}
