{ config, lib, pkgs, ... }@moduleArgs:

let
  inherit (lib) mkForce;
  system_type = config.mobile.system.type;
  defaultUserName = if moduleArgs ? "user" then moduleArgs.user else "sam";
in
{
  imports = [
    ./gnome.nix
  ];

  config = {
    users.users."${defaultUserName}" = {
      isNormalUser = true;
      password = lib.mkDefault "1234";
      extraGroups = [
        "dialout"
        "feedbackd"
        "networkmanager"
        "video"
        "wheel"
      ];
    };
    services.openssh = {
      enable = true;
    };

    sound.enable = true;
    hardware.pulseaudio.enable = true;
    services.pipewire.enable = lib.mkForce false;
    zramSwap.enable = true;
    networking.firewall.enable = false;
    system.stateVersion = "24.05";
  };
}
