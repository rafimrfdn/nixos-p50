{
  description = "Display Configuration (Sway, Waybar, etc.)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        ./modules/sway.nix
        ./modules/waybar.nix
      ];
    };
  };
}
