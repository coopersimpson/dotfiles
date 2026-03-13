{
  description = "Cooper's macOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }:
    let
      system = "aarch64-darwin";
      username = "cooper";
      homeDirectory = "/Users/cooper";
      hostname = "Coopers-Mac-mini";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        inherit system;

        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager

          {
            users.users.${username}.home = homeDirectory;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${username} = { lib, ... }: {
              imports = [ ./home.nix ];
              home.username = lib.mkForce username;
              home.homeDirectory = lib.mkForce homeDirectory;
            };
          }
        ];

        specialArgs = {
          inherit username homeDirectory hostname;
        };
      };
    };
}