{ inputs, ... }:
let
  inherit (inputs.nixpkgs.lib) optionals;
in

# TODO: Use `lib.makeOverridable`?

{ device      ? "oneplus-fajita"
, system      ? "aarch64-linux"
, modules     ? [ ]
, specialArgs ? { }
, user        ? "sam"
, ...
} @ args:

inputs.nixpkgs.lib.nixosSystem rec {
  inherit system;

  specialArgs = {
    inherit inputs;
    inherit (args) device user;
  };

  modules = [

    { _module.args = specialArgs; }

    (import "${inputs.nixos-mobile}/lib/configuration.nix" {
      inherit (args) device;
    })

    # nixpkgs-gnome-mobile.nixosModules.gnome-module

    #./snowflake.nix
    #inputs.snowflake.nixosModules.snowflake
    #inputs.nix-data.nixosModules."aarch64-linux".nix-data
  ] ++ optionals (args ? "modules") args.modules;

}
