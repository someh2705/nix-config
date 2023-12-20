{
  description = "NixOS configuration";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs:
  let
    mkConfigurations = 
      { 
        system ? "x86_64-linux",
        inputs,
        modules,
      }: nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = inputs;
          modules = modules ++ [
            (import ./hosts)

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
  
              home-manager.users.nixos = (import ./home);
            }
          ];
        };
  in {
    nixosConfigurations = {
      "wsl" = mkConfigurations {
        inputs = inputs;
        modules = [
          nixos-wsl.nixosModules.wsl
          (import ./hosts/wsl.nix)
        ];
      };
    };
  };
}
