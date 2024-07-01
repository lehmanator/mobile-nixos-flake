{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-android-recovery-installer";
  version = "1.0.4";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "postmarketos-android-recovery-installer";
    rev = version;
    hash = "sha256-g//KQ3IhuZ/UWJKWsIvzi6ee9qr4qDKpimZbL37ad0Q=";
  };

  meta = with lib; {
    description = "TWRP compatible postmarketOS installer script";
    homepage = "https://gitlab.com/postmarketOS/postmarketos-android-recovery-installer";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-android-recovery-installer";
    platforms = platforms.all;
  };
}
