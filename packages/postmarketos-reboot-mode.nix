{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "reboot-mode";
  version = "1.0.0";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "reboot-mode";
    rev = version;
    hash = "sha256-+W40tbVFo6/3gw3lD58YP+phfbTnaqHpnwK+Uign22E=";
  };

  meta = with lib; {
    description = "Reboot a mobile device to a specific mode";
    homepage = "https://gitlab.com/postmarketOS/reboot-mode";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "reboot-mode";
    platforms = platforms.all;
  };
}
