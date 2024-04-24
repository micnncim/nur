{ pkgs, lib, fetchurl }:

pkgs.stdenv.mkDerivation rec {
  pname = "apollo-ios-cli";
  version = "1.10.0";

  src = fetchurl {
    url = "https://github.com/apollographql/apollo-ios/releases/download/${version}/apollo-ios-cli.tar.gz";
    # Computed with `nix-prefetch-url`.
    sha256 = "1p2mjw6s0xlnsi8hy51c2ffv1brwbk8smhcyilkdr2v52mamfi0w";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./apollo-ios-cli $out/bin/apollo-ios-cli
  '';
}
