{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-gpmbootstrap";
  version = "unstable-2024-01-28";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "gpmbootstrap";
    rev = "9e08fb63332af7c847ff549c520dac8c953b653e";
    hash = "sha256-Shf22cN+usLs5O2vANUTQDJemUyXgXOm5p7BwD09Y7A=";
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "Proof of concept for a GTK frontend. Pay attention to README.md, you probably want to use [pmbootstrap](https://wiki.postmarketos.org/wiki/Pmbootstrap) instead";
    homepage = "https://gitlab.com/postmarketOS/gpmbootstrap";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-gpmbootstrap";
    platforms = platforms.all;
  };
}
