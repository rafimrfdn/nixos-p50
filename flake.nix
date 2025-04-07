{
  description = "
                            __   __      ___                 ___ 
    |\/| \ /    |\ | | \_/ /  \ /__`    |__  |     /\  |__/ |__  
    |  |  |     | \| | / \ \__/ .__/    |    |___ /~~\ |  \ |___ 
  ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Add hardware module for Thinkpad P50, this will activate and optimize nvidia driver.
  };


  outputs = { self, nixpkgs, nixos-hardware, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixhost = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
      };
    };
  };
}
