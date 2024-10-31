{ pkgs, config, ... }:

pkgs.stdenv.mkDerivation {
  pname = "dwmblocks-async";
  version = "1.0";

  # Use the current directory as the source
  src = ./source;

  # Dependencies required to build dwmblocks
  buildInputs =  [ pkgs.gcc pkgs.gnumake];

  # The build process uses make by default
  buildPhase = ''
    make
  '';

  # Copy the built binary to the output directory
  installPhase = ''
    mkdir -p $out/bin
    cp dwmblocks $out/bin/
  '';

  # Optional metadata about the package
  meta = with pkgs.lib; {
    description = "A modular status bar for dwm";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
