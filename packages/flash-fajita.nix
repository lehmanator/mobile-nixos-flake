{ lib
, writeShellApplication
, mobile-nixos-flasher
, ...
}:
writeShellApplication {
  name = "flash-fajita";
  runtimeInputs = [mobile-nixos-flasher];
  text = ''
    ${lib.getExe mobile-nixos-flasher} \
      --manufacturer OnePlus \
      --product "OnePlus Fajita (A64)" \
      --package .#fajita-disk-image \
      --file mobile-nixos.img
  '';
}
