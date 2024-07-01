{ lib
, writeShellApplication
, mobile-nixos-flasher
, ...
}:
writeShellApplication {
  name = "flash-fajita-boot";
  runtimeInputs = [mobile-nixos-flasher];
  text = ''
    ${lib.getExe mobile-nixos-flasher} \
      --manufacturer OnePlus \
      --product "OnePlus Fajita (A64)" \
      --package .#fajita-boot-partition \
      --file mobile-nixos.img
  '';
}
