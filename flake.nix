{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    mobile-nixos = {
      url = "github:nixos/mobile-nixos/development";
      flake = false;
    };
    gnome-mobile.url = "github:lehmanator/nixpkgs-gnome-mobile/develop";
    snowflake.url = "github:snowflakelinux/snowflake-modules";
    nix-data.url = "github:snowflakelinux/nix-data";
    nix-software-center.url = "github:vlinkz/nix-software-center";
    nixos-conf-editor.url = "github:vlinkz/nixos-conf-editor";
    snow.url = "github:snowflakelinux/snow";
  };

  outputs = inputs @ { nixpkgs, mobile-nixos, ... }:
    let

      inherit (inputs.nixpkgs.lib) nixosSystem;
      inherit (inputs.flake-utils.lib) eachDefaultSystem;

    in
    {

      nixosConfigurations.fajita = nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; user = "sam"; };
        modules = [
          { _module.args = { inherit inputs; user = "sam"; }; }
          (import "${inputs.mobile-nixos}/lib/configuration.nix" {
            device = "oneplus-fajita";
          })
          ./configuration.nix
          #./snowflake.nix
          #inputs.snowflake.nixosModules.snowflake
          #inputs.nix-data.nixosModules."aarch64-linux".nix-data
          inputs.gnome-mobile.nixosModules.gnome-mobile
        ];
      };

      nixosConfigurations.uefi-x86_64 = nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; user = "sam"; };
        modules = [
          { _module.args = { inherit inputs; user = "sam"; }; }
          (import "${inputs.mobile-nixos}/lib/configuration.nix" {
            device = "uefi-x86_64";
          })
          ./configuration.nix
          inputs.gnome-mobile.nixosModules.gnome-mobile
        ];
      };

      nixosConfigurations.fajita_minimal = nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; user = "sam"; };
        modules = [
          { _module.args = { inherit inputs; user = "sam"; }; }
          (import "${inputs.mobile-nixos}/lib/configuration.nix" {
            device = "oneplus-fajita";
          })
        ];
      };

      fajita-fastboot-images = inputs.self.nixosConfigurations.fajita.config.mobile.outputs.android.android-fastboot-images;
      fajita-minimal-image = inputs.self.nixosConfigurations.fajita_minimal.config.mobile.outputs.android.android-fastboot-images;
      uefi-x86_64-image = inputs.self.nixosConfigurations.uefi-x86_64.config.mobile.outputs.default;
    } // inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ (import inputs.gnome-mobile.overlays.default) ]; };
      in
      {
        packages = {
          fajita-fastboot-images = inputs.self.nixosConfigurations.fajita.config.mobile.outputs.android.android-fastboot-images;
          fajita-minimal-image = inputs.self.nixosConfigurations.fajita_minimal.config.mobile.outputs.android.android-fastboot-images;
          uefi-x86_64-image = inputs.self.nixosConfigurations.uefi-x86_64.config.mobile.outputs.default;
          #gnome-shell-mobile = (pkgs.callPackage pkgs.gnome-shell-mobile);
          #gnome-shell-mobile-devel = pkgs.gnome-shell-mobile-devel;
          #mutter-mobile = pkgs.mutter-mobile;
          #mutter-mobile-devel = pkgs.mutter-mobile-devel;
        };
      });
}
