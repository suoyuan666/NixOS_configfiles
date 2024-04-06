{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations = {
      OpenOS = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        hyprland.nixosModules.default
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.zuos = import ./home/home.nix;
          }
      ];
      };
    };
  };
}
