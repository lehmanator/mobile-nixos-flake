# flake, inputs',
{ inputs, ... }: {
  system = "aarch64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "pine64-pinephone";
    })
    #flake.nixosModules.pinephone-base-config
  ];
}
