{
  description = "Flake for mobile NixOS";
  inputs = {
    flake-utils.url          = "github:numtide/flake-utils";
    nixpkgs.url              = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-gnome-mobile.url = "github:Lehmanator/nixpkgs-gnome-mobile/develop";
    nixos-mobile = {
      url = "github:nixos/mobile-nixos/development";
      flake = false;
    };
    nixos-conf-editor.url   = "github:vlinkz/nixos-conf-editor";
    nix-software-center.url = "github:vlinkz/nix-software-center";
    nix-data.url            = "github:snowflakelinux/nix-data";
    snowflake.url           = "github:snowflakelinux/snowflake-modules";
    snow.url                = "github:snowflakelinux/snow";
  };

  outputs = { self, flake-utils, nixpkgs, nixpkgs-gnome-mobile, nixos-mobile, ... }@inputs:
  let
    mobileNixosSystem = import ./lib/mobileNixosSystem.nix { inherit inputs; };
  in
  {
    nixosConfigurations = {
      fajita_minimal = mobileNixosSystem {
        device = "oneplus-fajita";
      };
      fajita = mobileNixosSystem {
        device = "oneplus-fajita";
        modules = [ 
          nixpkgs-gnome-mobile.nixosModules.gnome-mobile
          ./configuration.nix
        ];
      };
      uefi-x86_64 = mobileNixosSystem {
        system = "x86_64-linux";
        device = "uefi-x86_64";
        modules = [
          nixpkgs-gnome-mobile.nixosModules.gnome-mobile
          ./configuration.nix
        ];
      };
    };

  } // (flake-utils.lib.eachDefaultSystem (system: {
    packages = let
      pkgs = import nixpkgs { inherit system; overlays = [ (import nixpkgs-gnome-mobile.overlays.default) ]; };
    in {
      fajita-fastboot-images = self.nixosConfigurations.fajita.config.mobile.outputs.android.android-fastboot-images;
      fajita-minimal-image   = self.nixosConfigurations.fajita_minimal.config.mobile.outputs.android.android-fastboot-images;
      uefi-x86_64-image      = self.nixosConfigurations.uefi-x86_64.config.mobile.outputs.default;
      #gnome-shell-mobile       = (pkgs.callPackage pkgs.gnome-shell-mobile);
      #gnome-shell-mobile-devel = pkgs.gnome-shell-mobile-devel;
      #mutter-mobile            = pkgs.mutter-mobile;
      #mutter-mobile-devel      = pkgs.mutter-mobile-devel;
    };
  }) // {
    fajita-fastboot-images = self.nixosConfigurations.fajita.config.mobile.outputs.android.android-fastboot-images;
    fajita-minimal-image   = self.nixosConfigurations.fajita_minimal.config.mobile.outputs.android.android-fastboot-images;
    uefi-x86_64-image      = self.nixosConfigurations.uefi-x86_64.config.mobile.outputs.default;

    # Build: nix-build --argstr device uefi-x86_64 -A pkgs.boot-recovery-menu-simulator
    # Run: result/bin/simulator --resolution 1080x1920
    #packages.x86_64-linux.uefi-boot-recovery-menu-simulator = self.nixosConfigurations.uefi-x86_64.config.mobile.pkgs.boot-recovery-menu-simulator;

    # Kernel configuration helper (assuming at root of (mobile-nixos?) repo)
    # $ bin/menuconfig $device_name

    # Recommended to run kernel configuration normalization helper.
    # $ bin/kernel-normalize-config $device_name
  });

  nixConfig = {
    extra-substituters = [ "https://lehmanator.cachix.org/" ];
    extra-trusted-public-keys = [ "lehmanator.cachix.org-1:kT+TO3tnSoz+lxk2YZSsMOtVRZ7Gc57jaKWL57ox1wU=" ];
  };
}
