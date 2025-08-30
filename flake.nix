{
  description = "ekkekuru2's AtCoder Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73.tar.gz";
          sha256 = "07gzgcgaclgand7j99w45r07gc464b5jbpaa3wmv6nzwzdb3v3q4";
        }) { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.hugo ];
        };
      }
    );
}
