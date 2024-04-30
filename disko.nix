{ targetDevice ? "/dev/disk/by-uuid/93c89e92-8f2e-4522-ad32-68faed883d2f", ... }: {
  services = {
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/nix" ];
    };
    # fstrim = {
    #   enable = true;
    # };
  };

  ## Workaround for:
  ##
  ## Failed assertions:
  ## - You must set the option ‘boot.loader.grub.devices’ or 'boot.loader.grub.mirroredBoots' to make the system bootable.
  ##
  ## This should be set by disko!
  boot.loader.grub.devices = [ targetDevice ];

  disko.devices = {
    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [
        "defaults"
        "mode=755"
        "size=8G"
      ];
    };

    disk.root = {
      type = "disk";
      device = targetDevice;
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          nix = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "btrfs";
              mountpoint = "/nix";
              mountOptions = [ "compress=zstd" ];
            };
          };
          encryptedSwap = {
            size = "8G";
            content = {
              type = "swap";
              randomEncryption = true;
            };
          };
        };
      };
    };
  };
}
