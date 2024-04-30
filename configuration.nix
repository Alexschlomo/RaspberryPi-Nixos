# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "raspberrypi";   
  networking.wireless.iwd = {
    enable = true;
    settings.Gerneral.EnableNetworkConfiguration = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raspberrypi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "network"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      neovim
      curl
      git
    ];
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeJrAUGNa1zVe9+Y9JdzxuxbOK0BTPIUX78+QWQPCeIF6LgisePYrQgfb6Bb5SvfL/GXfFDQ4QyyEQ+Ydpn+2e2TdTrEhFUfXwEF/YqTwpF+4zDsJgDjr5nNHV3dSAkzyrm0rCr6iXGlwXiew02Vwbl4xxMckoPMvXOTLEFA+TVFdBb4weAdhQQ9SZl+8luvmRhOtD0iOAoHPYZuAD7RtFbNsmyZptzvx9umQ0GCzOD5a7JB9n9gEgusp+zJs06FBLwkI8ce/IscZKyIzz8JZq4bWRoNm6MGJdIEep0EMs/2SjTAyWEH0ZOEQtgtI5gbuS9II/tCFXPnpui9MCPA7kKGyET6YJqBBkPQlXjzHPDqPSOnZK2++m3FEimWVbC12BMeLcwhCBJvCYDIep+8L5ChA4BDd5rBlQrGGFuG9bWMaFEcbQCfDiNZpy9qrK1mdRMs6/ySUeevr9EYlTzZBpjJsmIoM2/x9Apo1O/ga/Mzk3DbuhaOoMczivTWUHCD8= lak77@DESKTOP-DC5G3KQ"];
    initialPassword = "Start123";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  	
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

