{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
  };

  outputs = { nixpkgs, home-manager, hyprland, hyprlock, ... }@inputs: {
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
            home-manager.users.zuos = {
	        imports = [
	          ./home/home.nix
		  hyprlock.homeManagerModules.hyprlock
	        ];
	    };

            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
            # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
            # home-manager.extraSpecialArgs = inputs;
          }
      ];
      };
    };
  };
}
