{ description = "Thinkpad P50 flake";

    inputs = {
        nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Add hardware module for Thinkpad P50, this will activate and optimize nvidia driver.
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

       # copy from https://github.com/NixOS/nixpkgs/issues/295430 
        mpvSockets.url = "github:wis/mpvSockets";
        mpvSockets.flake = false;
        mpvSvpFix.url = "github:xrun1/mpv-svp-fix/3d4bc22ad14fcb2f46a3ce6a71b4a7b9ade574ea";
        mpvSvpFix.flake = false;

    };






    outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, ...}: # self is must have
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
                            backupFileExtension = "bakkkkkkkk";
                        };
                    }
                ];
            };
        };
    };
}
