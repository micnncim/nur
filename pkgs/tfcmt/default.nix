{ system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  version = "4.7.1";

  # Computed with `nix-prefetch-url`.
  shaMap = {
    x86_64-linux = "1jzzmzlkbmsc89f09d2zmnzj0lzbzdqayspyc77dkirvwfin9r4s";
    aarch64-linux = "18l78z56blw945mcj916ihc579mlvh7fvrfb388ixj7hdga6ss2m";
    x86_64-darwin = "0mkalkyj66kccadrvkf8ag2xqv8c48xliwg95j0fk7vilm3cw7l4";
    aarch64-darwin = "1pvrzr1h4p50m1kvybn9n1qh84295kjd65xdj7f9kqlls1pzbayg";
  };

  urlMap = {
    x86_64-linux = "https://github.com/suzuki-shunsuke/tfcmt/releases/download/v${version}/tfcmt_linux_amd64.tar.gz";
    aarch64-linux = "https://github.com/suzuki-shunsuke/tfcmt/releases/download/v${version}/tfcmt_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/suzuki-shunsuke/tfcmt/releases/download/v${version}/tfcmt_darwin_amd64.tar.gz";
    aarch64-darwin = "https://github.com/suzuki-shunsuke/tfcmt/releases/download/v${version}/tfcmt_darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  inherit version;

  pname = "tfcmt";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./tfcmt $out/bin/tfcmt
  '';

  system = system;
}
