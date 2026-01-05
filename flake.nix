{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = inputs @ { nixpkgs, home, alacritty-theme, ... }: let 
    inherit (inputs.nixpkgs) lib;
    inherit (lib) nixosSystem hasSuffix;
    inherit (lib.filesystem) listFilesRecursive;
    inherit (builtins) filter map toString;
    mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);
    wallpaper_path = ./wallpapers;

    in {
      nixosConfigurations = {
        mai = nixosSystem {
          specialArgs = { inherit inputs wallpaper_path; };
          system = "x86_64-linux";
          modules = [
            home.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs wallpaper_path; };
                useGlobalPkgs = true;
                useUserPackages = true;
              };
            }
            ({config, pkgs, ... }: {
              nixpkgs.overlays = [ alacritty-theme.overlays.default ];
            })
          ] ++ mkModules ./modules;
        };
      };
    };
}