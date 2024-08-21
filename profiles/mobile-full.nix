{ config, lib, pkgs, ... }:
{
  mobile = {
    adbd.enable = true;
    beautification = {
      silentBoot = lib.mkDefault false;
      splash = lib.mkDefault false;
      useKernelLogo = lib.mkDefault true;
    };
    boot = {
      boot-control.enable = true;
      defaultConsole = null;
      enableDefaultSerial = true;
      enableSerial = true;
      stage-1 = {
        bootlog = {
          enable = true;
          kmsg = false;
        };
        compression = lib.mkDefault "xz";
        contents = [ ];
        crashToBootloader = true;
        enable = true;
        extraUtils = [
          { package = pkgs.pls; extraCommand = ""; }
        ];
        fail = {
          delay = 10;
          reboot = true;
        };
        fbterm.fb = "/dev/fb1";
        firmware = [ ];
        gui = {
          enable = true;
          waitForDevices = {
            delay = 10;
            enable = true;
          };
        };
        kernel = {
          additionalModules = [ ];
          allowMissingModules = true;
          modular = false;
          modules = [ ];
          package = null; # Not kernelPackages attrset, but a kernel derivation directly.
          useNixOSKernel = !config.mobile.enable;
          useStrictKernelConfig = false;
        };
        networking = {
          IP = "172.16.42.1";
          enable = true;
          hostIP = "172.16.42.2";
        };
        shell = {
          console = "console";
          enable = true;
          shellOnFail = true;
        };
        ssh.enable = true;
        usb = {
          enable = true;
          features = [ ]; # `android_usb` features to enable
        };
      };
    };
    bootloader.enable = true;
    device = {
      firmware = null;
      identity = {
        manuafacturer = "oneplus";
        name = "fajita";
        supportLevel = "supported";
      };
    };
    enable = true;
    generatedDiskImages = {
      nix-store = {
        additionalCommands = ''
        '';
        alignment = 1048576;
        gpt = {
          diskID = "aaabbbccc...";
          hybridMBR = [ ];
          partitionEntriesCount = 128;
          imagePath = "${config.output}${config.location}";
          location = "";
        };
        mbr.diskID = "0123ABCD"; # Hex<8>
        name = "nixos-disk-image";
        partitioningScheme = "gpt";
        partitions = [
          {
            bootable = false;
            filesystem = {
              additionalCommands = ''
              '';
              btrfs.partitionID = "0123abCD-56EF-78aB-90CD-ef012345ABcd"; #
              ext4.partitionID = "0123abCD-56EF-78aB-90CD-ef012345ABcd"; #
              fat32.partitionID = "0123aBCd";
              extraPadding = 0;
              filesystem = "btrfs"; # btrfs | ext4 | fat32 | squashfs
              imagePath = "${config.output}${config.location}";
              label = "Nix Store";
              location = "";
              name = "nix-store";
              populateCommands = ''
              '';
              size = null;
              squashfs.compression = "xz";
            };
            isGap = false;
            length = null;
            name = "root";
            offset = null;
            partitionLabel = config.name;
            partitionType = "0FC63DAF-8483-4772-8E79-3D69D8477DE4"; # See partition type GUIDs (systemd discoverable partitions spec)
            partitionUUID = null;
            raw = null;
            requiredPartition = true;
          }
        ];
      };
    };
    generatedFilesystems = {
      root = {
        additionalCommands = ''
        '';
        btrfs.partitionID = "0123abCD-56EF-78aB-90CD-ef012345ABcd"; #
        ext4.partitionID = "0123abCD-56EF-78aB-90CD-ef012345ABcd"; #
        fat32.partitionID = "0123aBCd";
        extraPadding = 0;
        filesystem = "btrfs";
        imagePath = "${config.output}${config.location}";
        label = "Nix Store";
        location = "";
        name = "nix-store";
        populateCommands = ''
        '';
        size = null;
        squashfs.compression = "xz";
      };
    };
    hardware = {
      eink = {
        enable = false;
        enableEinkTheme = true;
      };
      ram = 8192;
      screen = { height = 6; width = 3.25; };
      soc.qualcomm-sdm845.enable = true;
    };
    kernel.structuredConfig = [
      # List of functions that evaluate to an attrset. Take one arg, attrset of helpers.
    ]; # Use w/ `with`, provide `yes`, `no`, `whenOlder`, & similar helpers from `lib.kernel`
    quirks = {
      audio.alsa-ucm-meld = true;
      fb-refresher = {
        enable = true;
        stage-1.enable = true;
      };
      fdt-forward = {
        nodes = [ ]; # FDT nodes to forward to the kexec'd system
        props = [ ]; # Pair of [node prop] to forward to the kexec'd system.
      };
      qualcomm = {
        dwc3-otg_switch.enable = true;
        fb-notify.enable = true;
        sdm845-modem.enable = true;
        wcnss-wlan.enable = true;
      };
      supportsStage-0 = true;
      u-boot.additionalCommands = ''
      '';
      wifi.disableMacAddressRandomization = false;
    };
    rootfs = {
      enableDefaultConfiguration = true;
      rehydrateStore = config.nix.enable;
    };
    system = {
      system = "aarch64-linux";
      android.appendDTB = true;
      type = "android";
    };
    usb = {
      gadgetfs.functions = { };
      idProduct = "fajita"; #?
      idVendor = "oneplus"; #?
      mode = "android_usb"; # android_usb | gadgetfs
    };
  };
  services.eg25-manager = { enable = true; package = pkgs.eg25-manager; };
}
