{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "boot-deploy";
  version = "0.14";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "boot-deploy";
    rev = version;
    hash = "sha256-KAKYd7Z1R6Faopo0/1Q82Hz0J/u1tYdj0YamwvC/Wlo=";
  };

  meta = with lib; {
    description = "";
    homepage = "https://gitlab.com/postmarketOS/boot-deploy";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "boot-deploy";
    platforms = platforms.all;
  };
}
