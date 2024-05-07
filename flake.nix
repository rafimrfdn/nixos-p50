{ description = "Thinkpad P50 flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    # outputs = { self, nixpkgs, home-manager, ...}: 
    outputs = inputs@{ self, nixpkgs, home-manager, ...}: 
    let 
        hostname = "nixhost";
        user = "nix";
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            ${hostname} = lib.nixosSystem {
                inherit system; 
                modules = [ 
                    ./configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            backupFileExtension = "backup";
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            # users.nix = ./home/home.nix;
                            users.${user}= import ./home/default.nix;
                            # from cristitus
                            # extraSpecialArgs = {inherit inputs self user;};
                        };
                    }
                ];
            };
        };
    };
}
