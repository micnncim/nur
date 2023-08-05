{ pkgs, lib, stdenv, fetchFromGitHub, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "kubectl-reveal";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-e/7Q0RhpEO8QeW+Z3ntqRlWFnxtEINKIheu3SSd1054=";
  };

  cargoSha256 = "sha256-LnAmJbz2A7REY8LrzE1goMwsD5BEw5TiwBSB7Hxu/os=";

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
