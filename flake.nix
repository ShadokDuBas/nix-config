{
  description = "Vincent Peth's config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, self, ... }:
    let
      # same as:
      # nixosSystem = pkgs.lib.nixosSystem;
      inherit (nixpkgs.lib) nixosSystem;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system;  };
      username = "vincent";
      make-home-module = path: {
        home-manager = {
          useGlobalPkgs = true;
	  users.${username} = {
	    imports = [ path ];
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
	    ./system/semigroup
	    home-manager.nixosModules.home-manager
	    nix-module
	    (make-home-module (./home/semigroup))
	  ];
        };

	    #    bootable-stick = nixosSystem {
	    #      inherit system;
	    #      packages.x86_64-linux.default = self.nixosConfigurations.exampleIso.config.system.build.isoImage;
	    # #      modules = [
	    # #        ./system/bootable-stick
	    # # home-manager.nixosModules.home-manager
	    # # nix-module
	    # # (make-home-module (./home/bootable-stick))
	    # #      ];
	    #      modules = [
	    #        ({ pkgs, modulesPath, ... }: {
	    #          imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
	    #          environment.systemPackages = [ pkgs.neovim ];
	    #        })
	    #      ];


	transducer = nixosSystem {
          inherit system;
	  modules = [
	    ./system/transducer
	    home-manager.nixosModules.home-manager
	    nix-module
	    (make-home-module (./home/transducer))
	  ];
        };
        };

      };
    };
}
