# Buat file default.nix

Isi dengan ini: 
```sh
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "dwmblocks";
  version = "2.0";

  # Fetch the source from GitHub
    # src = pkgs.fetchFromGitHub {
    #     owner = "torrinfail";        # Replace 'user' with the GitHub username
    #     repo = "dwmblocks";     # Replace 'dwmblocks' with the repository name
    #     rev = "master";           # Replace with the desired branch or commit hash
    #     sha256 = "sha256-QtYQB2mvw1k2LA8D+/cVnA8+GRDWjhIM6rxfi/IGjEw=";
    # };
  # Use the current directory as the source
  src = ./.; # kalau pakai local source build, kita bisa set custom config default.h

  # Dependencies required to build dwmblocks
  buildInputs = [
    pkgs.gcc
    pkgs.gnumake
    pkgs.pkg-config
    pkgs.xorg.libX11
    pkgs.xorg.libxcb
    pkgs.xorg.xcbutil
  ];

  # Use the existing Makefile for the build process
  buildPhase = ''
    make
  '';

  # Install phase: copy the built binary to the output directory
  installPhase = ''
    mkdir -p $out/bin
    cp dwmblocks $out/bin/
  '';

  # Optional metadata about the package
  meta = with pkgs.lib; {
    description = "An asynchronous modular status bar for dwm";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
```

## Build dwmblocks

cd ke folder dwmblocks yang memiliki file default.nix

build dengan perintah `sudo nix-build`

Setelah dibuild, akan ada folder `./result/`

dwmblocks bisa dieksekusi di `./result/bin/dwmblocks`

## Install secara global supaya bisa dieksekusi 

Proses build hanya proses mengcompile, saatnya install aplikasi dwmblocks di system.

Install dengan cara:

```sh
nix profile install ./result
```

Sekarang kita bisa eksekusi perintah dwmblocks dimanapun, kapanpun.
