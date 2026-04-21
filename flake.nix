{
  description = "Home Manager configuration of reticulmz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-devenv.url = "github:nixos/nixpkgs/3c46954c517169a4930a0f7308474d7d87fb47c1";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs =
    {
      nixpkgs,
      nixos-wsl,
      home-manager,
      nixpkgs-devenv,
      sops-nix,
      nix-index-database,
      nix-alien,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."reticulmz" = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./nixos/configuration.nix
          nixos-wsl.nixosModules.wsl
        ];
      };
      homeConfigurations."reticulmz" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home-manager/home.nix
          sops-nix.homeManagerModules.sops
          nix-index-database.homeModules.nix-index
        ];
        extraSpecialArgs = {
          oldPkgs = import nixpkgs-devenv { system = "x86_64-linux"; };
          nix-alien = nix-alien.packages.${system};
        };
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
