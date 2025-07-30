{
  description = "Home Manager configuration of cooper";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations = {
        "cooper-wsl2" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/core.nix ./hosts/wsl2.nix ];
        };
        "cooper-ubuntu" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/core.nix ./hosts/ubuntu.nix ];
        };
      };
    };
}
