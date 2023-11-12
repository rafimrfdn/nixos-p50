{
  description = "Thinkpad P50 flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    # home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self,nixpkgs, home-manager, ...}: 
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixhost = lib.nixosSystem {
        inherit system; 
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      nix = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 
        modules = [ ./home/home.nix ];
      };
    };

  };
}
