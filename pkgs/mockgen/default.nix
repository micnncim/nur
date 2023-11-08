{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "mockgen";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "uber-go";
    repo = "mock";
    rev = "v${version}";
    hash = "sha256-pwlssqk/2aXTOwchePJK7CqEQ6lkQv7E+aT3HzUhvpE=";
  };

  vendorHash = "sha256-mcNVud2jzvlPPQEaar/eYZkP71V2Civz+R5v10+tewA=";

  subPackages = [ "mockgen" ];
}
