{
  description = "Thinkpad P50 flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
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
    # set nodejs for development environment
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (self: super: rec {
            nodejs = super.nodejs-18_x;
            pnpm = super.nodePackages.pnpm;
            yarn = (super.yarn.override { inherit nodejs; });
          })
        ];
      };
    in pkgs.mkShell {
      # create an environment with nodejs-18_x, pnpm, and yarn
      packages = with pkgs; [
        node2nix
        nodejs
        pnpm
        yarn
      ];

      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
      '';
    };

  };
}
