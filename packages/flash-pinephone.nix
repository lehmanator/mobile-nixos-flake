{ lib
, writeShellScript
, writeShellApplication
, mobile-nixos-flasher
, ...
}:
writeShellApplication {
  name = "flash-pinephone";
  runtimeInputs = [mobile-nixos-flasher];
  text = ''
    ${lib.getExe mobile-nixos-flasher} \
      --manufacturer Pine64 \
      --product "Pinephone (A64)" \
      --package .#pinephone-disk-image \
      --file mobile-nixos.img
  '';
}
