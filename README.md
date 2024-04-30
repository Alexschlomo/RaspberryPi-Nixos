# RaspberryPi-Nixos

```sh
nix run github:nix-community/nixos-anywhere -- \
  --extra-files ./secrets \
  --disk-encryption-keys ./secrets/secret.key \
  --flake .#raspberrypi \
  root@192.168.178.175 
```
