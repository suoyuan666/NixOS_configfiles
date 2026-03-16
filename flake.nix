{
  description = "NixOS config for me";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url       = "github:nix-community/nixvim";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.nixpkgs.follows       = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      OpenOS = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hardware-configuration.nix
          ./host/laptop/suoyuan/config.fix

          ./modules/system/core.nix

          ./modules/secuirty/hardened/kernel.nix
          ./modules/secuirty/network.nix

          ./modules/desktop/gnome.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zuos = {
              imports = [
                ./home/home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
