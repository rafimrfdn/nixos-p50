{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "dwmblocks-async";
  version = "1.0";

  # Use the current directory as the source
  src = ./.;

  # Dependencies required to build dwmblocks
  buildInputs = [
    pkgs.gcc
    pkgs.gnumake
    pkgs.pkg-config
    pkgs.xorg.libxcb
    pkgs.xorg.libX11
    pkgs.xorg.xcbutil
  ];

  # Ensure proper include directories for the build
  buildPhase = ''
    make 
  '';

  # Install phase: copy the built binary to the output directory
  installPhase = ''
    mkdir -p $out/bin
    cp build/dwmblocks $out/bin/
  '';

  # Optional metadata about the package
  meta = with pkgs.lib; {
    description = "An asynchronous modular status bar for dwm";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
