{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
    users.raspberrypi = {
      directories = [
        { directory = ".ssh"; mode = "0700"; }
      ];
      files = [];
    };
  };
}
