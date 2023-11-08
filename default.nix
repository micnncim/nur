# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  gctx = pkgs.callPackage ./pkgs/gctx { };
  gh-sync = pkgs.callPackage ./pkgs/gh-sync { };
  kubectl-reveal-secret = pkgs.callPackage ./pkgs/kubectl-reveal { };
  mockgen = pkgs.callPackage ./pkgs/mockgen { };
  slack-cli = pkgs.callPackage ./pkgs/slack-cli { };
  tfcmt = pkgs.callPackage ./pkgs/tfcmt { };
}
