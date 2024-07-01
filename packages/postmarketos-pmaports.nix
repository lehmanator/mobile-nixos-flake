{ lib
, stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "postmarketos-pmaports";
  version = "unstable-2024-04-13";

  src = fetchFromGitLab {
    owner = "postmarketOS";
    repo = "pmaports";
    rev = "583ab0a2fe5060a682e43a008113f29c46574c5c";
    hash = "sha256-0IgdU4lod7MO+kFcHJHMiMyf6PDK3xiem3aZ+ZNq/hA=";
  };

  meta = with lib; {
    description = "PostmarketOS package build recipes";
    homepage = "https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/community/device-oneplus-fajita";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "postmarketos-pmaports";
    platforms = platforms.all;
  };
}
