{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    rpi5.url = "git+https://gitlab.com/vriska/nix-rpi5";
  };
  outputs = { self, nixpkgs, disko, impermanence, rpi5 }: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.raspberrypi = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit rpi5;
      };
      modules = [
        ./configuration.nix 
	./disko.nix
	disko.nixosModules.disko
	impermanence.nixosModules.impermanence 
      ];
    };
  };
}
