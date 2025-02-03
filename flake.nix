# { description = "Thinkpad P50 flake";
#
#     inputs = {
#         nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Add hardware module for Thinkpad P50, this will activate and optimize nvidia driver.
#         nixpkgs.url = "nixpkgs/nixos-unstable";
#         #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
#         home-manager.url = "github:nix-community/home-manager/master";
#         home-manager.inputs.nixpkgs.follows = "nixpkgs";
#     };
#
#     outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, ...}:  #self is must have
#     let 
#         hostname = "nixhost";
#         user = "nix";
#         lib = nixpkgs.lib;
#         system = "x86_64-linux";
#     in {
#         nixosConfigurations = {
#             ${hostname} = lib.nixosSystem {
#                 inherit system; 
#                 modules = [ 
#                     nixos-hardware.nixosModules.lenovo-thinkpad-p50
#                     ./configuration.nix
#                     home-manager.nixosModules.home-manager {
#                         home-manager = {
#                             useGlobalPkgs = true;
#                             useUserPackages = true;
#                             users.${user}= import ./home/default.nix;
#                             backupFileExtension = "bak3";
#                         };
#                     }
#                 ];
#             };
#         };
#     };
# }

{
  description = "My Modular NixOS Configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Add hardware module for Thinkpad P50, this will activate and optimize nvidia driver.
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    display-flake.url = "path:./flakes/display";
  };

  outputs = { self, nixpkgs, home-manager, display-flake, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/nixhost/configuration.nix
        # nixos-hardware.nixosModules.lenovo-thinkpad-p50
        display-flake.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nix = import ./hosts/nixhost/home.nix;
        }
      ];
    };
  };
}
