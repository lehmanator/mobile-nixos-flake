{ config, lib, pkgs, user, ... }:
{
  imports = [ 
    ./profiles/gnome.nix
  ];

  config = {
    users.users."${user}" = {
      isNormalUser = true;
      uid = 1000;
      password = "343536";
      extraGroups = [
        "dialout"
        "feedbackd"
        "networkmanager"
        "video"
        "wheel"
        "gdm"
      ];
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2M80EUw0wQaBNutE06VNgSViVot6RL0O6iv2P1ewWH ${user}@fw" ];
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
