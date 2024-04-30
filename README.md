# RaspberryPi-Nixos

Create the directory Secrets and two subdirectories

```sh
mkdir -p secrets/{boot,tmp}
```

```sh
wget https://github.com/worproject/rpi5-uefi/releases/download/v0.3/RPi5_UEFI_Release_v0.3.zip
unzip RPi5_UEFI_Release_v0.3.zip
mv config.txt secrets/boot
mv RPI_EFI.fd secrets/boot
vim secrets/secrets.key #Enter your Diskencryption Key without new lines
```

Install Flakeoutput Raspberrypi to address root@<IP Address> and copy all data. Read Diskencryption-Key 

```sh
nix run github:nix-community/nixos-anywhere -- \
  --extra-files ./secrets \
  --disk-encryption-keys ./secrets/secret.key \
  --flake .#raspberrypi \
  root@192.168.178.175 
```
