{ inputs, ... }: {
  system = "aarch64-linux";
  specialArgs = { 
    inherit inputs;
    device = "oneplus-fajita";
  };
  modules = [
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "oneplus-fajita";
    })
  ];
}
