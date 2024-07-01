{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flakelight.url = "github:nix-community/flakelight";
    mobile-nixos = {
      url = "github:Lehmanator/mobile-nixos/fajitafix";
      # url = "github:mobile-nixos/mobile-nixos/development";
      flake = false;
    };
    gnome-mobile.url = "github:Lehmanator/nixpkgs-gnome-mobile/main";
    snowflake.url = "github:snowflakelinux/snowflake-modules";
    nix-data.url = "github:snowflakelinux/nix-data";
    nix-software-center.url = "github:vlinkz/nix-software-center";
    nixos-conf-editor.url = "github:vlinkz/nixos-conf-editor";
    snow.url = "github:snowflakelinux/snow";
  };

  outputs = inputs@{ self, flakelight, nixpkgs, mobile-nixos, ... }:
    flakelight ./. ({ lib, ... }: {
      inherit inputs;
      systems = lib.systems.flakeExposed;
      nixDir = ./.;
      withOverlays = [
        (import "${inputs.mobile-nixos}/overlay/overlay.nix")
        inputs.gnome-mobile.overlays.gnome-mobile
        inputs.gnome-mobile.overlays.nixpkgs-gnome-apps
      ];
      overlays = inputs.gnome-mobile.overlays // { };
      nixosModules.mobile = {
        imports = (map (e: "${inputs.mobile-nixos}/modules/${e}.nix") [
          "adb"
          "beautification"
          "boot-control"
          "boot-initrd"
          "boot"
          "bootloader"
          "cross-workarounds"
          "devices-metadata"
          "documentation"
          "generated-filesystems"
          "hardware-allwinner"
          "hardware-eink"
          "hardware-exynos"
          "hardware-generic"
          "hardware-mediatek"
          "hardware-qualcomm"
          "hardware-ram"
          "hardware-rockchip"
          "hardware-screen"
          "hardware-soc"
          "hardware"
          "initrd-base"
          "initrd-boot-gui"
          "initrd-fbterm"
          "initrd-fail"
          "initrd-firmware"
          "initrd-kernel"
          "initrd-logs"
          "initrd-network"
          "initrd-shell"
          "initrd-ssh"
          "initrd-usb"
          "initrd-vendor"
          "initrd"
          "internal"
          "kernel-config"
          "lib"
          "luks"
          "mobile"
          "mobile-device"
          "nixpkgs"
          "plymouth"
          "recovery"
          "rootfs"
          "shared-rootfs"
          "stage-0"
          "system-build"
          "system-target"
          "system-types"
          "usb-gadget"
          "zram"
        ]) ++ [ "${inputs.mobile-nixos}/modules/quirks" ];
      };
      nixpkgs.config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
      };
      packages = {
        # pinephone-disk-image = inputs.self.nixosConfigurations.pinephone.config.mobile.outputs.default;
        # pinephone-boot-partition = inputs.self.nixosConfigurations.pinephone.config.mobile.outputs.u-boot.boot-partition;
        # pinephone-vm = inputs.self.nixosConfigurations.config.mobile.outputs.uefi.vm;
      };
      apps = {
        flash-pinephone = pkgs: {
          type = "app";
          program = "${lib.getExe pkgs.flash-pinephone}";
        };
        flash-pinephone-boot = pkgs: {
          type = "app";
          program = "${lib.getExe pkgs.flash-pinephone-boot}";
        };
      };

      # packages = {
      #   fajita-fastboot-images = inputs.self.nixosConfigurations.fajita.config.mobile.outputs.android.android-fastboot-images;
      #   fajita-minimal-image   = inputs.self.nixosConfigurations.fajita-minimal.config.mobile.outputs.android.android-fastboot-images;
      #   uefi-x86_64-image      = inputs.self.nixosConfigurations.uefi-x86_64.config.mobile.outputs.default;
      # };
    });

  nixConfig = {
    connect-timeout = 10;
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
      "https://lehmanator.cachix.org/"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lehmanator.cachix.org-1:kT+TO3tnSoz+lxk2YZSsMOtVRZ7Gc57jaKWL57ox1wU="
    ];
  };
}
