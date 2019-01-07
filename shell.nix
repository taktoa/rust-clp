{ pkgs ? import ./nix/nixpkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "rust-clp-0.1.0";

  src = null;

  buildInputs = [
    pkgs.clp
    pkgs.pkgconfig
  ];

  LIBCLANG_PATH = "${pkgs.llvmPackages_6.libclang.lib}/lib";
}
