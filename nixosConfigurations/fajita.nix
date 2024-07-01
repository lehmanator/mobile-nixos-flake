#flake, inputs',
{ inputs, ... }: {
  system = "aarch64-linux";
  specialArgs = { 
    inherit inputs;
    user = "sam";
    device = "oneplus-fajita";
  };
  modules = [
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "oneplus-fajita";
    })
    inputs.self.nixosModules.mobile-base
    # inputs.self.nixosModules.snowflake
    # inputs.nix-data.nixosModules."aarch64-linux".nix-data
    # inputs.gnome-mobile.nixosModules.gnome-mobile
  ];
}
