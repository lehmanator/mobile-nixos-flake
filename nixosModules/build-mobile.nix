{ pkgs, ... }:
# flake,
{
  # imports = [];
  # options = {};
  config = {
    boot.binfmt.emulatedSystems = ["aarch64-linux"];
    environment.systemPackages = [
      pkgs.mobile-nixos-flasher
      # flake.outputs'.packages.mobile-nixos-flasher
    ];
  };
}
