{ config, lib, pkgs, user, ... }: {
  users.users.${user} = {
    isNormalUser = true;
    uid = 1000;
    password = lib.mkDefault "343536";
    extraGroups = [
      "dialout"
      "feedbackd"
      "networkmanager"
      "video"
      "wheel"
      "gdm"
    ];
  };

  services.openssh = {
    enable = lib.mkIf (config.users.users.${user}.openssh.authorizedKeys.keys != []) true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = lib.mkForce false;
  zramSwap.enable = true;
  networking.firewall.enable = false;
  system.stateVersion = "23.11";
}
