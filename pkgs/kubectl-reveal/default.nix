{ pkgs, lib, stdenv, fetchFromGitHub, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "kubectl-reveal";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-5fIaLqz9chzuaOErt94n90PY+uH5FW6U8r72ps5e6W8=";
  };

  cargoSha256 = "sha256-7XACFVqn9gSHnvKT0eUXO6CBE9gKNnYvJj3xV5oU1kE=";

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
