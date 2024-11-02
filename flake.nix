{ description = "Thinkpad P50 flake";

    inputs = {
        nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Add hardware module for Thinkpad P50, this will activate and optimize nvidia driver.
        nixpkgs.url = "nixpkgs/nixos-unstable";
        #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };


    outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, ...}: # self is must have
    let 
        hostname = "nixhost";
        user = "nix";
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        # pkgs = nixpkgs.legacyPackages.${system}; 
    in {
        nixosConfigurations = {
            ${hostname} = lib.nixosSystem {
                inherit system; 
                modules = [ 
                    nixos-hardware.nixosModules.lenovo-thinkpad-p50
                    ./configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            # users.nix = ./home/home.nix;
                            users.${user}= import ./home/default.nix;
                            # from cristitus
                            # extraSpecialArgs = {inherit inputs self user;};
                            backupFileExtension = "bakkkkkkkkkkkkkk";
                        };
                    }
                ];
            };
        };
    };
}
