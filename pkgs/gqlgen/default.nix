{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gqlgen";
  version = "0.17.45";

  src = fetchFromGitHub {
    owner = "99designs";
    repo = "gqlgen";
    rev = "v${version}";
    hash = "sha256-iWTeI21B/xJu/LFKGYwu0ggjh/59SlE/qm+5aPzyN9U=";
  };

  vendorHash = "sha256-Qk+93pnqEOf/xOfVNQ82KiDOiO6ucjffYGfwONNPRaw=";

  doCheck = false;

  subPackages = [ "." ];
}
