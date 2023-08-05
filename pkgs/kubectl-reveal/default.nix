{ pkgs, lib, stdenv, fetchFromGitHub, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "kubectl-reveal";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "micnncim";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-rythWKGUvAjfib3IvyAqU48oy9p1FTTJcxdrWCUH1fs=";
  };

  cargoSha256 = "sha256-Yg6lQFhGOXw56M02eWmPG+sFVEiWkzkQQoKF9IJiww4=";

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
