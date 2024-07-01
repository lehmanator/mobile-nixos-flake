{ lib
, docopts
, writeShellApplication
}:
writeShellApplication {
  name = "mobile-nixos-flasher";
  runtimeInputs = [ docopts ];
  text = builtins.readFile ./flasher.sh;
}
