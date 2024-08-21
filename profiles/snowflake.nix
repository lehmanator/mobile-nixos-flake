{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    inputs.nixos-conf-editor.packages.${pkgs.system}.nixos-conf-editor
    inputs.snow.packages.${pkgs.system}.snow
    pkgs.git # For rebuiling with github flakes
  ];
  programs.nix-data = {
    systemconfig = "/etc/nixos/configuration.nix";
    flake = "/etc/nixos/flake.nix";
    flakearg = "fajita";
  };
  snowflakeos.gnome.enable = true;
  snowflakeos.osInfo.enable = true;
}
