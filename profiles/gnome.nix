#
# This file represents safe opinionated defaults for a basic GNOME mobile system.
#
# NOTE: this file and any it imports **have** to be safe to import from
#       an end-user's config.
#
{ config, lib, pkgs, options, ... }:
let
  inherit (lib) mkDefault;
in
{
  mobile = {
    adbd.enable = mkDefault true;
    beautification = {
      silentBoot    = mkDefault false;
      splash        = mkDefault false;
      useKernelLogo = mkDefault true;
    };
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverrides = ''
        [org.gnome.mutter.dynamic-workspaces]
        enabled=true
      '';
      extraGSettingsOverridePackages = [ pkgs.gnome.mutter ];
    };
  };

  hardware.sensor.iio.enable = true;
  programs.calls.enable = true;

  environment = {
    gnome.excludePackages = (with pkgs; [
      gnome-tour
    ]);
    systemPackages = with pkgs; [
      chatty        # IM and SMS
      epiphany      # Web browser
      gnome-console # Terminal
      megapixels    # Camera
    ];
  };

}

    #boot = {
    #  boot-control.enable = true;
    #  defaultConsole = null;
    #  enableDefaultSerial = true;
    #  enableSerial = true;
    #  stage-1 = {
    #    bootlog = {
    #      enable = true;
    #      kmsg = false;
    #    };
    #    compression = lib.mkDefault "xz";
    #    contents = [];
    #    crashToBootloader = true;
    #    enable = true;
    #    fail = {
    #      delay = 10;
    #      reboot = true;
    #    };
    #    fbterm.fb = "/dev/fb1";
    #    firmware = [];
    #    gui = {
    #      enable = true;
    #      waitForDevices = {
    #        delay = 10;
    #        enable = true;
    #      };
    #    };
    #    kernel = {
    #      additionalModules = [];
    #      allowMissingModules = true;
    #      modular = false;
    #      modules = [];
    #      package = null; # Not kernelPackages attrset, but a kernel derivation directly.
    #      useNixOSKernel = !config.mobile.enable;
    #      useStrictKernelConfig = false;
    #    };
    #    networking = {
    #      IP = "172.16.42.1";
    #      enable = true;
    #      hostIP = "172.16.42.2";
    #    };
    #    shell = {
    #      console = "console";
    #      enable = true;
    #      shellOnFail = true;
    #    };
    #    ssh.enable = true;
    #    usb = {
    #      enable = true;
    #      features = []; # `android_usb` features to enable
    #    };
    #  };
    #};
    #bootloader.enable = true;
    #enable = true;
    #hardware.soc.qualcomm-sdm845.enable = true;
    #kernel.structuredConfig = [  # List of functions that evaluate to an attrset. Take one arg, attrset of helpers.
    #]; # Use w/ `with`, provide `yes`, `no`, `whenOlder`, & similar helpers from `lib.kernel`
    #quirks = {
    #  audio.alsa-ucm-meld = true;
    #  fb-refresher = {
    #    enable = true;
    #    stage-1.enable = true;
    #  };
    #  fdt-forward = {
    #    nodes = [];  # FDT nodes to forward to the kexec'd system
    #    props = []; # Pair of [node prop] to forward to the kexec'd system.
    #  };
    #  qualcomm = {
    #    dwc3-otg_switch.enable = true;
    #    fb-notify.enable = true;
    #    sdm845-modem.enable = true;
    #    wcnss-wlan.enable = true;
    #  };
    #  supportsStage-0 = true;
    #  u-boot.additionalCommands = ''
    #  '';
    #  wifi.disableMacAddressRandomization = false;
    #};
    #rootfs = {
    #  enableDefaultConfiguration = true;
    #  rehydrateStore = config.nix.enable;
    #};
