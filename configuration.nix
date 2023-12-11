{ config, lib, pkgs, user, ... }:
{
  imports = [ ./gnome.nix ];

  config = {
    users.users."${user}" = {
      isNormalUser = true;
      password = "343536";
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
    system.stateVersion = "23.11";
  };
}
