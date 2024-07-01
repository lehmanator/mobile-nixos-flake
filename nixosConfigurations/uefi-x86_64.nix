#flake,
{ inputs, ... }: {
  system = "x86_64-linux";
  specialArgs = { 
    inherit inputs;
    device = "oneplus-fajita";
  };
  modules = [
    # { _module.args = {inherit inputs; }; }
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "uefi-x86_64";
    })
    # inputs.gnome-mobile.nixosModules.gnome-mobile
  ];
}
