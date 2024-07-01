{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-on-device-installer";
  version = "unstable-2024-01-04";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "ondev2";
    rev = "f1fe7cc7428d000a6e4138de5caf035ba1b2e074";
    hash = "sha256-iPCAPIG41PB2YX7xfGjhrXNmmkP3akw1X7p25Bz4jsI=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "Experimental new version of the on-device installer";
    homepage = "https://gitlab.com/postmarketOS/ondev2";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-on-device-installer";
    platforms = platforms.all;
  };
}
