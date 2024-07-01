{ lib
, writeShellApplication
, mobile-nixos-flasher
, ...
}:
writeShellApplication {
  name = "flash-pinephone-boot";
  runtimeInputs = [mobile-nixos-flasher];
  text = ''
    ${lib.getExe mobile-nixos-flasher} \
      --manufacturer Pine64 \
      --product "Pinephone (A64)" \
      --partition 3 \
      --package .#pinephone-boot-partition \
      --file mobile-nixos-boot.img
  '';
}
