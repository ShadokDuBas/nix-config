{
  description = "Vincent Peth's config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      # same as:
      # nixosSystem = pkgs.lib.nixosSystem;
      inherit (nixpkgs.lib) nixosSystem;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system;  };
      username = "vincent";
      home-module = {
        home-manager = {
          useGlobalPkgs = true;
	  users.${username} = {
	    imports = [ ./home/home.nix ];
	    config.home = {
              inherit username;
	      homeDirectory = "/home/${username}";
            };
	  };
        };
      };
      nix-module = {
        nix.registry.stable = {
	  from = {
	    type = "indirect";
	    id = "stable";
	  };
	  flake = nixpkgs;
	};
      };
    in {
      nixosConfigurations = {
	semigroup = nixosSystem {
          inherit system;
	  modules = [
	    ./system/configuration.nix
	    home-manager.nixosModules.home-manager
	    nix-module
	    home-module
	  ];
        };
      };
    };
}