{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      home-manager,
      nvf,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations.theophile = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/laptop
          ./modules/nixos
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = { inherit inputs; };

              users.theophile = {
                imports = [
                  inputs.nvf.homeManagerModules.nvf
                  ./home/theophile/home.nix
                ];
              };

              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
