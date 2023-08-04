{ stdenv, fetchurl, ... }:

let
  version = "2.6.0";
  platform = stdenv.hostPlatform;
  archive =
    if platform.isLinux then
      {
        url = "https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_linux_64-bit.tar.gz";
        # sha256 is calculated by `nix-prefetch-url https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_linux_64-bit.tar.gz`.
        sha256 = "1ynx2lzv6cg26h1sa6wccr0k404pi8msjcj42bm42z6ixlfwm8hn";
      }
    else if platform.isDarwin then
      {
        url = "https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_macOS_64-bit.tar.gz";
        # sha256 is calculated by `nix-prefetch-url https://downloads.slack-edge.com/slack-cli/slack_cli_${version}_macOS_64-bit.tar.gz`.
        sha256 = "1vyrdnk5il0zf3x3sxgsaidi7rbwbjcmg6l8a8rnz9ff7zmmk8pf";
      }
    else throw "Unsupported platform ${platform}";
in
stdenv.mkDerivation rec {
  pname = "slack-cli";
  inherit version;

  src = fetchurl {
    inherit (archive) url sha256;
  };

  installPhase = ''
    mkdir -p $out/bin
    cp slack $out/bin/slack
  '';
}
