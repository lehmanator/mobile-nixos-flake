# flake, inputs',
{ inputs, ... }: {
  system = "x86_64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "uefi-x86_64";
    })
    #flake.nixosModules.fajita-base-config
  ];
}
